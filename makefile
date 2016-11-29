# makefile for WP17 manuscript

all: outline.pdf

outline.pdf: outline.md	\
	         metadata.yaml \
			 bibliography.yaml \
			 figures/appliance-ownership-by-access-type.png \
			 figures/energy-by-end-use.png
	pandoc --bibliography bibliography.yaml \
		   --filter pandoc-citeproc \
		   outline.md metadata.yaml \
		   -o outline.pdf


figures/appliance-ownership-by-access-type.png: figures/appliance-ownership-by-access-type.ipynb
	runipy figures/appliance-ownership-by-access-type.ipynb

figures/energy-by-end-use.png: figures/energy-by-end-use.ipynb
	runipy figures/energy-by-end-use.ipynb
