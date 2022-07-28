
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
# Dockerfile
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
What Dockerfile is
==================
-   Configure docker instance with a file called "Dockerfile" (no extension)
-   Written as a script, with docker DSL commands written in sequence.

Related: .dockerignore file
---------------------------
-   Docker modifies the context to exclude files and directories that match patterns in the .dockerignore file.

### Example
```
# Insert some comment here
*/temp*
*/*/temp*
temp?

# All markdown files except README.md are excluded from the context
*.md
!README.md

```

----------------------------------------------------------------------------------------------------
Launch rules
============
-   Should specify at least one of CMD or ENTRYPOINT commands
    -   ENTRYPOINT should be defined when using the container as an executable
    -   CMD should be used as a way of either:
        1. Defining default arguments for an ENTRYPOINT command; or
        2. Executing an ad-hoc command in a container.
    -   CMD will be overridden when running the container with alternative arguments


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
Dockerfile commands
===================
WORKDIR
-------
-   Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile
-   If WORKDIR doesn’t exist, it will be created.
-   Note: Can be used multiple times.
    -   If relative path provided, it'll be relative to the path of the previous WORKDIR instruction

### Example
    WORKDIR /path/to/workdir


----------------------------------------------------------------------------------------------------
COPY
----
-   Copies new files or dirs from <src> and adds them to the filesystem of the container at path <dest>.

### Examples
##### Add all files starting with 'hom', to an absolute path:

    COPY hom* /my_absolute/path_to_dir/

##### Add all files matching a wildcard-based file name check, to an absolute path:

    COPY hom?.txt /my_absolute/path_to_dir/
-   Would take home.txt, homa.txt, homm.txt, homi.txt, etc.

##### Copy a file to a relative path:

    COPY test.txt relativeDir/


----------------------------------------------------------------------------------------------------
LABEL
-----
-   Adds metadata to an image
    -   A LABEL is a key-value pair.
    -   To include spaces in a LABEL value, use quotes and backslashes as you would in the CLI
-   Multiple LABELs can be included

### Examples
#### Add 2 LABEL fields
```
    LABEL version="1.0"
    LABEL description="This text illustrates \
    that label-values can span multiple lines."
```

#### Add multiple LABEL key-value pairs in a single LABEL command
```
    LABEL multi.label1="value1" multi.label2="value2" other="value3"

```

----------------------------------------------------------------------------------------------------
ENTRYPOINT [launching]
----------------------
-   Allows you to configure a container that will run as an executable.

### General syntax
ENTRYPOINT ["executable_shell_command", "arg1-to-cmd", ...]

### Example
Run `top -b` on launching docker instance:

    ENTRYPOINT ["top", "-b"]

- Has the instance do nothing else but run top -b

----------------------------------------------------------------------------------------------------
CMD [launching]
---------------
### General syntax
Has 2 relevant formats:

1. Exec form (preferred):
    ```
    CMD ["executable","param1","param2"] # (exec form, this is the preferred form)
    ```

2. As default parameters to ENTRYPOINT:
    ```
    CMD ["param1","param2"]
    ```
    -   In this second case, whatever is passed to CMD gets passed as arguments to end of the ENTRYPOINT command.

### Unique
-   There can only be one CMD instruction in a Dockerfile
    -   If you list more than one, only the last one runs.


----------------------------------------------------------------------------------------------------
ENV
---
-   Sets environment variables to the given values

### Example

    ENV FOO=/bar

    -   Sets environment variable "FOO" to have value '/bar' in the docker instance.


----------------------------------------------------------------------------------------------------
EXPOSE
------
`EXPOSE 8888`
-   Expose port 8888 to the outside

----------------------------------------------------------------------------------------------------
RUN
---
The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile

----------------------------------------------------------------------------------------------------
ADD
---

----------------------------------------------------------------------------------------------------
