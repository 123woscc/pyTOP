init:
	pip install -r reqs.txt

test:
	nosetests test.py

ci: init
	nosetests test.py --with-xunit --xunit-file=junit-report.xml

site:
	cd doc; make html

doc: site
	zip doc.zip doc/_build/html/*; mv doc.zip ./dist/

stats: 
	pyflakes pyTOP | awk -F\: '{printf "%s:%s: [E]%s\n", $$1, $$2, $$3}' > violations.pyflakes.txt

publish:
	python setup.py publish

install:
	python setup.py install
