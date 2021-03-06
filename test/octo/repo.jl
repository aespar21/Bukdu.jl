module test_octo_repo

importall Bukdu
importall Bukdu.Octo
importall .Octo.Query
importall .Octo.Repo
import .Adapter: NoAdapterError
import Base.Test: @test, @test_throws

# Logger.set_level(:debug)

type User
    id::PrimaryKey
    name::String
    age::Int
end

type Comment
    id::PrimaryKey
    body::String
end

in(User) do user
    has_many(user, :comments, Comment)
end

@test isdefined(Query.A, :User)

user = User(0, "foo bar", 20)
insertquery = Query.insert(user)
@test isa(insertquery, InsertQuery)

@test_throws NoAdapterError Query.statement(Query.insert(User, name="foo bar", age=20))

adapter = Database.setup(Adapter.MySQL) do adapter
    Adapter.connect(adapter, host="127.0.0.1", user="root", pass="", db="")
end

function init_test()
    SQL.execute(adapter, "DROP DATABASE IF EXISTS mysqltest;")
    SQL.execute(adapter, "GRANT USAGE ON *.* TO 'test'@'127.0.0.1';")
    SQL.execute(adapter, "DROP USER 'test'@'127.0.0.1';")
end

function create_test_database()
    SQL.execute(adapter, "CREATE DATABASE mysqltest;")
    SQL.execute(adapter, "CREATE USER test@127.0.0.1 IDENTIFIED BY 'test';")
    SQL.execute(adapter, "GRANT ALL ON mysqltest.* TO test@127.0.0.1;")
end

init_test()
create_test_database()
Adapter.disconnect(adapter)

Adapter.connect(adapter, host="127.0.0.1", user="test", pass="test", db="mysqltest")

SQL.execute(adapter, """CREATE TABLE users (
                     ID INT NOT NULL AUTO_INCREMENT,
                     name VARCHAR(255),
                     age INT,
                     Salary FLOAT(7,2),
                     PRIMARY KEY (ID)
                 );""")

@test "INSERT INTO users (name, age) VALUES ('foo bar', 20)" == Query.statement(Query.insert(User, name="foo bar", age=20))
@test "INSERT INTO users (name, age) VALUES (?, ?)" == Query.statement(Query.insert(User, name=?, age=?))

# insert
SQL.insert(adapter, Query.insert(User, name="foo bar", age=20))
Repo.insert(User, name="bar", age=20)

hey = User(0, "hey", 30)
Repo.insert(hey)

SQL.all(adapter, from(User))

if !isa(adapter.handle, Void)
    user1 = Repo.get(User, 1)
    @test isa(user1, User)
    @test "foo bar" == user1.name

    user2 = Repo.get(User, 2)
    @test isa(user2, User)
    @test "bar" == user2.name

    user1000 = Repo.get(User, 1000)
    @test isa(user1000, Void)
    change1 = Changeset(user1, Assoc(name="change1"))
    Repo.update(change1)

    u = in(User)
    users = Repo.get(Vector{User}, where= u.age == 20)
    @test isa(users, Vector{User})
    @test 2 == length(users)

    users = Repo.get(Vector{User}, where= or(u.age == 20, u.name == "hey"))
    @test 3 == length(users)

    Repo.delete(User, 1)

    Adapter.disconnect(adapter)
end

Database.reset()

end # module test_octo_repo
