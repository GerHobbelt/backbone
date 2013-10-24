
.PHONY: all lib doc lint clean

all: lib doc


clean:
	-@rm backbone-min.js
	-@rm backbone-min.map
	-@touch backbone.js
	-@rm docs/backbone*.html
	-@rm docs/todo*.html


lib: backbone-min.js


doc:		                               	\
						docs/backbone.html 	\
						docs/backbone.localStorage.html \
						docs/todos.html    	\


lint:
	rake lint


backbone-min.js:                  			\
						backbone.js 		\
						package.json       	\
						Rakefile           	\
						index.html         	\
						README.md          	\
						index.js           	\
						docs/jsl.conf      	\
						Makefile
	@echo "*** Regenerating backbone.js ***"
	rake build
#   rake lint


docs/backbone.html 							\
docs/backbone.localStorage.html 			\
docs/todos.html    							\
	: 										\
						package.json       	\
						Rakefile           	\
						index.html         	\
						README.md          	\
						index.js           	\
						backbone.js       	\
						docs/jsl.conf      	\
						docs/docco.css     	\
						Makefile
	@echo "*** Regenerating backbone.js documentation ***"
	rake doc
