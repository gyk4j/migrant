# migrant
A minimalist [Vagrant](https://www.vagrantup.com/) replacement for 
[Oracle VirtualBox](https://www.virtualbox.org/).

> [!NOTE]  
> *migrant* is in the process of redesign and redevelopment with a new 
> programming language. The old files used for prototyping certain features
> and functionalities have been moved to the `archived` directory for archival
> and safekeeping purpose.
>   
> While the original aim of implementing *migrant* was to keep it simple by 
> reusing whatever the system environment already offers, it has become
> increasingly clear that relying on the system's native scripting languages
> and tools would fail to achieve the requirements to be simple, portable
> across operating systems (i.e. Windows and Linux), and be largely self-
> contained.
>   
> After prototyping, the following problems have been identified:
>   
> - Different operating systems have missing tools that require extra third 
>   party ones to be installed, especially for handling `tar.gz` compressed 
>   data and parsing JSON data.
> - The [batch file] scripting language is limited; it requires hacks for
>   basic string parsing and manipulation, and splitting codes into blocks and 
>   functions.
>   
> All these add to the complexity of deployment and usage on end-user systems.
> Thus, another programming language for a new implementation is required.

## Installation

There are implementations for Bash Shell, Batch and PowerShell, which require
external binary tools/dependencies.

| Operating System | Language   |     curl    |     jq      |    tar      |
|------------------|------------|:-----------:|:-----------:|:-----------:|
| Linux            | Bash       |      *      |[Install][0] |     *       |
| Windows          | Batch/CMD  |[Download][1]|[Download][2]|[Download][3]|
| Windows          | PowerShell |             |             |[Download][3]|

\* Usually already pre-installed. No action needed.

[0]: https://jqlang.org/download/
[1]: https://curl.se/windows/
[2]: https://jqlang.org/
[3]: https://gnuwin32.sourceforge.net/packages/gtar.htm
