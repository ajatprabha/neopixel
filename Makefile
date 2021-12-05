build:
	@python setup.py sdist bdist_wheel

clean:
	@rm -rf build dist neopixel.egg-info

install:
	@pip install -e .

release:
	@python -m twine upload dist/*

test-upload:
	@python -m twine upload --repository testpypi dist/*

install-deps:
	@pipenv shell
	@pip install --global-option='build_ext' --global-option="-I$(brew --prefix)/include" --global-option="-L$(brew --prefix)/lib" pyaudio
	@pipenv install
