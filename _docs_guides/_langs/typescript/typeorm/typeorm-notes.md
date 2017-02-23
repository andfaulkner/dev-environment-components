TypeORM notes
=============
Repositories
------------
*   each entity has its own "repository".
*   repositories can be obtained from your connection
*   3 types of repositories:
    1.  Repository
        *   allow to work with your specific entity
        *   allows insert / update / delete or find entities
        *   access repository via connection connection.getRepository(Entity)
        *   [has several public APIs](https://typeorm.github.io/repository.html#repository)
            *   create(plainObject: Object): Entity
                *   Creates new entity instance
                *   Copies all entity props from this object into new entity
            *   find(conditions: ObjectLiteral): Promise<Entity[]>
                *   Finds entities that match given conditions and/or find options
            *   query(query: string): Promise<any>
                *   Executes raw SQL query & returns raw DB results
    2.  TreeRepository
        WIP
    3.  SpecificRepository
        WIP

Query Builder
-------------
*   build queries to fetch data from the db


