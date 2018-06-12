echo "Recursively clone mupdf..."

git clone --recursive git://git.ghostscript.com/mupdf.git
cd mupdf

cd platform\win32

IF NOT EXIST "libmupdf.vcxproj" ( echo "Upgrade all project files (maybe it takes > 10min), please wait..." && devenv /upgrade mupdf.sln ) else ( echo "Use cached vcxproj files." )

echo "Start building..."
msbuild /m mupdf.sln /property:Configuration=Release /p:Platform=Win32