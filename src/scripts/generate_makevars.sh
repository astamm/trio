#! /bin/sh

PKG_LIBS=$1

# Generate the Makevars file

echo "CXX_STD = CXX11" > Makevars
echo "PKG_CPPFLAGS = -Ivtk\$(WIN)/include" >> Makevars
echo ${PKG_LIBS} >> Makevars
echo "" >> Makevars
echo ".PHONY: all ./vtk\$(WIN)/lib/libvtk_all.a" >> Makevars
echo "" >> Makevars
echo "SOURCES = fiberReaders.cpp RcppExports.cpp" >> Makevars
echo "" >> Makevars
echo "OBJECTS = \$(SOURCES:.cpp=.o)" >> Makevars
echo "" >> Makevars

OBJECTS_VTK_ALL="OBJECTS_VTK_ALL = `find vtk\$(WIN)/lib -name "*.o" -o -name "*.obj" | xargs`"
echo ${OBJECTS_VTK_ALL} >> Makevars
echo "" >> Makevars
echo "all: \$(SHLIB)" >> Makevars
echo "" >> Makevars
echo "\$(SHLIB): ./vtk\$(WIN)/lib/libvtk_all.a" >> Makevars
echo "" >> Makevars
echo "./vtk\$(WIN)/lib/libvtk_all.a: \$(OBJECTS_VTK_ALL)" >> Makevars
echo "	  \$(AR) -crvs ./vtk\$(WIN)/lib/libvtk_all.a \$(OBJECTS_VTK_ALL)" >> Makevars
echo "	  \$(RANLIB) \$@" >> Makevars
echo "" >> Makevars
echo "clean:" >> Makevars
echo "	  rm -f \$(OBJECTS) *.dll *.exe" >> Makevars
echo "	  rm -fr vtk\$(WIN)" >> Makevars
