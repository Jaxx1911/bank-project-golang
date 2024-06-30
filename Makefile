postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres
createdb:
	docker exec -it postgres createdb --username=root --owner=root bank-project-golang

dropdb:
	docker exec -it postgres dropdb bank-project-golang

migrateup:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/bank-project-golang?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:root@localhost:5432/bank-project-golang?sslmode=disable" -verbose down


.PHONY: postgres createdb dropdb migrateup migratedown