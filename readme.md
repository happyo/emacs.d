git clone git@github.com:happyo/emacs.d.git ~/.emacs.d
git clone git@github.com:happyo/Zettelkasten.git
 git submodule init
 git submodule update

brew install ripgrep

proxy-http-enable
all-the-icons-install-fonts

brew install fd


pip3 install epc orjson sexpdata==0.0.3 six
pip3 install openai epc sexpdata six

cd emacs-application-framework
chmod +x ./install-eaf.py
./install-eaf.py
