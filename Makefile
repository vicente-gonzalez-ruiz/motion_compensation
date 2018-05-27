default:	index.html

index.html:	index.ipynb
		jupyter nbconvert --to html index.ipynb
