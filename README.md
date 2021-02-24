# README
### CV AppData Cache Clear

#### Table of Contents

[About](#about)  
[Getting Started](#getting-started)  
[Troubleshooting](#troubleshooting)  
[License](#license)

## About

The CV AppData Cache Clear PowerShell script is designed to provide remote management/deletion of AppData cache for end user consoles using CompleteView Desktop Client 2020. This is useful when a user reports that they are experiencing error messages when attempting to log in to CompleteView 2020 that are not indicative of a credentials mismatch.

This script works by allowing the user to provide the target computer's hostname, the NTID of the user, and the CompleteView 2020 usernmae of the user, where it then saves these inputs as variables to identify the exact AppData directory associated with the specific user and delete it.

It is currently supported in Microsoft Windows 10, Microsoft Windows Server 2012/2012R2, Microsoft Windows Server 2016, and Microsoft Windows Server 2019.

## Getting Started

1. Launch the .ps1 file (a double-click should suffice; if necessary, right-click and choose Run As Administrator)
2. Follow the prompts as they come up during execution
3. When complete, it will ask if you have any other computers requiring AppData cache removal; if so, follow the prompts; if not, it will exit the script

## Troubleshooting

This script may not work if:

1. You do not have the necessary permissions to run PowerShell scripts on the machine you are attempting to execute this script from
2. The version of PowerShell on the system you are using to execute this script is older/not supporting the commands in this script
3. You do not have the necessary permissions to run PowerShell scripts across your network

If you run into issues outside of the above, you may need to review the specific errors and/or troubleshoot the errors with your server/systems/IT administrator.

## License

Distributed under the MIT license.

Copyright 2021 James Anderson, Escalation Engineer, Salient Systems Corporation

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
