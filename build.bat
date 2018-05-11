git clone --recursive git://git.ghostscript.com/mupdf.git

cd mupdf
mkdir -r generated\resources\fonts\

cd platform\win32

devenv /upgrade mupdf.sln

msbuild /m mupdf.sln /property:Configuration=Release