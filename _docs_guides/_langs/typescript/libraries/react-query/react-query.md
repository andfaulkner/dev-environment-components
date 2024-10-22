React Query (RQ)
================
-   What is it?
    -   Server-state library
    -   Manages the async operations between your server & client
    -   Turns boilerplate code & related wiring used to manage cache data in your client state
        into just a few lines of code

        -   In most apps, the globally accessible client-state left over after migrating all
            your async code to React Query is usually tiny.

Query
-----
-   What is it?
    -   A declarative dependency on an async data source, tied to a unique key

-   Can be used with any Promise based method (including GET & POST methods) to
    fetch data from a server.

-   DOES NOT MODIFY DATA - this is what a mutation is for.

Usage
-   Subscribe to a query by calling useQuery with at least a:
    -   Query key (QK)      : Unique key for the query; and
    -   Query function (QF) : Promise-returning function that resolves the data or throws an err.

Example:
```ts
import {useQuery} from '@tanstack/react-query'

const App = () => {
    const result = useQuery({
        queryKey: ['todos'],
        queryFn: fetchTodoList
    });
};
```
-   `'todos'`      : Unique key.
-   `fetchTodoList`: Data fetcher.
-   `result`       : Data fetch response. In 1 of 3 states: `isPending`, `isError`,`isSuccess`.

### Extra props from useQuery hook
Example:
```ts
const {isPending, isError, data, error, status} = useQuery({
    queryKey: ['todos'],
    queryFn: fetchTodoList,
});
```
-   `isPending`: If true, data is loading.
-   `isError`  : If true, request failed.
-   `data`     : Return data from request.
-   `error`    : Contains error object is request failed.
-   `status`   : Either `pending`, `error`, or `success`.
                 - Usable instead of `isPending` or `isError`.


----------------------------------------------------------------------------------------------------
Client hook - useQueryClient
----------------------------
```ts
import {useQueryClient} from 'react-query';

/**
 * useQueryClient: returns the current QueryClient instance.
 *
 * QueryClient can be used to interact with a cache.
 */
const queryClient = useQueryClient();
```


----------------------------------------------------------------------------------------------------
Query key (QK)
--------------
-   What is it?
    -   How Tanstack manages query caching for you
    -   **Like a dependency array for your query function** (akin to `useEffect`'s)
        -   Treat it as such

-   Must be:
    1.  Array at the top level
    2.  Serializable
    3.  Unique to the query's data

-   Varying complexity. Can be as:
    -   Simple as an arr w/ a single string; or
    -   Complex as an arr of many strings & nested objects.

-   Note: Add every var used in the queryFn (QF) to the query key
    -   Ensures queries are cached independently & refetched automatically when the vars change

Example:
```ts
useQuery({
    // This is the query key
    queryKey: ['todo', todoId],
    // Does the fetching
    queryFn: () => api.getTodo(todoId),
});

const todoQueries = {
    detail: (id) => ({
        // Reference to query key
        queryKey: ['todo', id],
        queryFn: () => api.getTodo(id)
    }),
};
```

### Simple query key
-   Simplest form: an array with constants values
-   Uses:
    -   Generic List/Index resources
    -   Non-hierarchical resources

Examples:
```ts
useQuery({ queryKey: ['todos'], ... });                // Example 1
useQuery({ queryKey: ['something', 'special'], ... }); // Example 2
```

### Array query key with vars
-   What is it?
    -   An array with a string and any number of serializable objects to describe it
    -   Use if a query needs more info to uniquely describe its data.

-   Useful for:
    -   Hierarchical or nested resources
        -   It's common to pass an ID, index, or other primitive to uniquely identify it.
    -   Queries with additional params
        -   It's common to pass an object with additional options.

Examples:
```ts
useQuery({queryKey: ['todo', 5], ...});                  // Individual todo
useQuery({queryKey: ['todo', 5, {preview: true}], ...}); // Individual todo in a preview format
useQuery({queryKey: ['todos', {type: 'done'}], ...});    // List of todos that are "done"
```

### Note: query keys are hashed deterministically
-   This means:
    -   The order of keys in any objects in query keys (but NOT in the query key arrays themselves)
        don't matter.
    -   Any key in an object in a query key that's set to undefined gets ignored.

-   BUT REMEMBER: order matters in the query key array

### Include any var your query function depends on in your query key
-   QK should include any vars you use in your QF that change.
-   Adding dependent variables to your query key will ensure:
    -   Queries are cached independently;
    -   any time a var changes, queries get auto-refetched (depending on your staleTime settings)

See the exhaustive-deps section for more information and examples

Example:
```tsx
const Todos = ({todoId}: {todoId: number}) => {
    const result = useQuery({
        queryKey: ['todos', todoId],
        queryFn: () => fetchTodoById(todoId),
    });
};
```
Above, the todoId number gets included in the request.


----------------------------------------------------------------------------------------------------
Query Cache (QC)
----------------
-   Just a JavaScript object where:
    -   The keys are serialized QKs
    -   The values are your Query Data (QD) plus meta information.
-   There is only one.

-   WARNING: YOU CANNOT USE THE SAME KEY FOR `useQuery` AND `useInfiniteQuery`


----------------------------------------------------------------------------------------------------
Auto-refetch
------------
-   If you have some state that changes your data, all you need to do is put it
    in the QK, because React Query (RQ) will trigger a refetch automatically
    when the QK changes.

-   When you want to apply your set[X] (e.g. setFilters) function again, just
    change your client state - e.g.:

```tsx
const Component = () => {
    const [filters, setFilters] = React.useState()
    const {data} = useQuery({
        queryKey: ['todos', filters],
        queryFn: () => fetchTodos(filters),
    });

    // ✅ Set local state and let it drive the query
    return <Filters onApply={setFilters} />
};
```
-   Above: the rerender the setFilters update triggers above passes a different
    QK to RQ, making it refetch.


----------------------------------------------------------------------------------------------------
Query filters (QFs)
-------------------


