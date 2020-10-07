param(
   [string]$moduleName = "newModule",
   [string]$moduleDir  = "..\modules"
)

New-Item -Name $moduleName -ItemType Directory -Path $moduleDir

"# Add Output Here" > "$moduleDir\$moduleName\output.tf"
"# Add Variables Here" > "$moduleDir\$moduleName\variables.tf"
"# Add Main logic Here" > "$moduleDir\$moduleName\main.tf"
