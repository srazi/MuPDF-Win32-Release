echo "Recursively clone mupdf..."
git clone --recursive git://git.ghostscript.com/mupdf.git

echo "Fix font not found errors..."
copy resources\fonts\urw\NimbusSans-Bold.cff resources\fonts\urw\NimbusSansNarrow-Bold.cff
copy resources\fonts\urw\NimbusSans-Oblique.cff resources\fonts\urw\NimbusSansNarrow-Oblique.cff
copy resources\fonts\urw\NimbusSans-Regular.cff resources\fonts\urw\NimbusSansNarrow-Regular.cff
copy resources\fonts\urw\NimbusSans-BoldOblique.cff resources\fonts\urw\NimbusSansNarrow-BdOblique.cff

cd platform\win32

echo "Workaround to fix compile issue..."
mkdir x64\release\libresources

IF NOT EXIST "libmupdf.vcxproj" ( echo "Upgrade all project files (maybe it takes > 10min), please wait..." && devenv /upgrade mupdf.sln ) else ( echo "Use cached vcxproj files." )

echo "Start building..."
msbuild /m mupdf.sln /property:Configuration=Release