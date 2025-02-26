# dotfiles
Zsh and Bash dotfile snippets for a better time in Nix land

---

## Zsh `f` Function: A Shortcut for `find`

This repository includes a handy Zsh function `f` that simplifies the use of the `find` command by automatically wrapping the final argument in `*` for pattern matching. It supports flexible usage, allowing you to pass paths, options, and patterns as needed.

## Installation

1. Clone this repository or add the function to your existing dotfiles.
2. Add the following function definition to your `.zshrc` file:

   ```bash
   f() {
       if [[ $# -eq 0 ]]; then
           echo "Usage: f [<PATH>] <PATTERN>"
           echo "       f <FIND_OPTIONS> <PATTERN>"
           return 1
       fi

       # If only one argument is passed, treat it as the pattern
       if [[ $# -eq 1 ]]; then
           find . -iname "*$1*"
           return
       fi

       # If two arguments are passed, treat the first as the path and the second as the pattern
       if [[ $# -eq 2 ]]; then
           find "$1" -iname "*$2*"
           return
       fi

       # For more than two arguments, treat all but the last as regular find options
       # and wrap the last argument in "*" for pattern matching
       local args=("$@")  # Copy all arguments into an array
       local last_arg="${args[-1]}"  # Get the last argument
       args[-1]="*$last_arg*"  # Wrap the last argument in "*"

       # Run the find command with the modified arguments
       find "${args[@]}"
   }
   ```
3. Reload your .zshrc file to apply the changes:
   ```bash
   source ~/.zshrc
   ```
# Usage

The `f` function is designed to be flexible and intuitive. Here are some examples of how to use it:

### Basic Usage

  - Search for a pattern in the current directory:

    ```bash
    f my_awesome_file
    ```
    Expands to:
    ```bash
    find . -iname "*my_awesome_file*"
    ```
  - Search for a pattern in a specific directory:

    ```bash
    f /path/to/search my_awesome_file
    ```
### Advanced Usage
   - Use find options and wrap the final argument in `*`:

     ```bash
     find /path/to/search -type f -mtime -7 -iname "*my_awesome_file*"
     ```
   - Use find without pattern wrapping (regular find behavior):

     ```bash
     f /path/to/search -type f -mtime -7
     ```

     Runs as:
     ```bash
     find /path/to/search -type f -mtime -7
     ```
### Why Use This?
- Saves Time: No need to manually wrap patterns in * for find.
- Flexible: Supports all find options and arguments.
- Intuitive: Works seamlessly for both simple and complex find commands.



