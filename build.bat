echo "Recursively clone mupdf..."
git clone --recursive git://git.ghostscript.com/mupdf.git

echo "Fix issue using Git mkdir..."
cd mupdf
mkdir generated\resources\fonts\

echo "Replace fontdump.nmake..."
copy /y %APPVEYOR_BUILD_FOLDER%\scripts\fontdump.nmake scripts\

cd platform\win32

echo "Upgrade all project files..."
devenv /upgrade mupdf.sln

echo "Start building..."
msbuild /m mupdf.sln /property:Configuration=Release