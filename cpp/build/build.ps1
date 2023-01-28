cmake ..
cmake --build . --config=Release
Copy-Item -Path .\Release\4H3DGM.dll -Destination ../../datafiles -Force
