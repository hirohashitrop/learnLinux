message:
	@echo "---------------------------------------------------------------------------------------"
	@echo "                               For Ubuntu 16.04 LST                                    "
	@echo "---------------------------------------------------------------------------------------"
	@echo "update: update package source list"
	@echo "nocaps: change caps lock to Ctrl [Run only onetime]"
	@echo "basic: install basic apps"
	@echo "mol: install UniproGENE and MEGAX, Aaconda"
	@echo "stat: install R and RStudio"
	@echo "utilAll: install chrome pdf spotify skype zoom teamviwer"
	@echo "---------------------------------------------------------------------------------------"

##############################
#        Basic setups        #
##############################
update:
	sudo apt update

nocaps:
	sudo grep -l 'XKBOPTIONS=""' /etc/default/keyboard | sudo xargs sed -i.bak -e 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:nocaps"/g'

basic:
	sudo apt install -y gdebi-core exfat-utils git ibus-mozc curl

##############################
#     Research analysis      #
##############################
mol: ugene megax anaconda
stat: R RStudio

ugene:
	sudo add-apt-repository ppa:iefremov/ppa
	sudo apt update
	sudo apt install -y ugene ugene-non-free ugene-data

megax:
	wget https://www.megasoftware.net/do_force_download/megax_10.1.6-1_amd64.deb
	sudo gdebi megax_10.1.6-1_amd64.deb

R:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
	sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/'
	sudo apt update
	sudo apt install -y r-base r-base-dev
	echo "FYI : https://cran.r-project.org/bin/linux/ubuntu/README.html"

RStudio:
	wget https://download1.rstudio.org/desktop/xenial/amd64/rstudio-1.2.5033-amd64.deb
	sudo gdebi rstudio-1.2.5033-amd64.deb
	wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh

Rdepend:
	sudo apt install libgtk2.0-dev xvfb xauth xfonts-base libxt-dev libxml2-dev curl libcurl4-openssl-dev libssl-dev

anaconda:
	wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
	bash Anaconda3-2019.10-Linux-x86_64.sh

##############################
#          Utilites          #
##############################
utilAll: chrome pdf spotify skype zoom teamviwer
chrome:
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo gdebi google-chrome-stable_current_amd64.deb

pdf:
	wget http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
	tar xvf FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
	./FoxitReader.enu.setup.2.4.4.0911\(r057d814\).x64.run

spotify:
	curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt update && sudo apt install spotify-client

skype:
	wget https://repo.skype.com/latest/skypeforlinux-64.deb
	sudo gdebi skypeforlinux-64.deb

zoom:
	wget https://zoom.us/client/latest/zoom_amd64.deb
	sudo gdebi zoom_amd64.deb

teamviwer:
	wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
	sudo gdebi teamviewer_amd64.deb

mendeley:
	wget https://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest
	sudo gdebi mendeleydesktop_*_amd64.deb
	
flameshot:
	wget https://github.com/lupoDharkael/flameshot/releases/download/v0.6.0/flameshot_0.6.0_xenial_x86_64.deb
	sudo gdebi flameshot_0.6.0_xenial_x86_64.deb

##############################
#        developing          #
##############################
wine:
	sudo dpkg --add-architecture i386
	wget -nc https://dl.winehq.org/wine-builds/winehq.key
	sudo apt-key add winehq.key
	sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main'
	sudo apt update
	sudo apt install --install-recommends winehq-stable

#############################
#           snap            #
#############################
snap:
	sudo snap install snapd
	snap install slack


