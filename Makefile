message:
	@echo "---------------------------------------------------------------------------------------"
	@echo "                  For Ubuntu 16.04 LST and 18.04.04 LST and 20.04 LTS                  "
	@echo "---------------------------------------------------------------------------------------"
	@echo "update: update package source list"
	@echo "nocaps: change caps lock to Ctrl [Run only onetime]"
	@echo "basic: install basic apps"
	@echo "mol: install UniproGENE and MEGAX, Aaconda"
	@echo "stat: install R and RStudio"
	@echo "utilAll: install chrome pdf spotify skype zoom teamviwer"
	@echo "DragNDrop: https://ubuntuhandbook.org/index.php/2020/10/enable-drag-drop-desktop-ubuntu-20-04/"
	@echo "---------------------------------------------------------------------------------------"

##############################
#        Basic setups        #
##############################
update:
	sudo apt update

nocaps:
	sudo grep -l 'XKBOPTIONS=""' /etc/default/keyboard | sudo xargs sed -i.bak -e 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:nocaps"/g'

basic:
	sudo apt install -y gdebi-core exfat-utils git ibus-mozc curl unar

##############################
#     Research analysis      #
##############################
mol: ugene megax anaconda
stat: R RStudio14

ugene:
	sudo add-apt-repository ppa:iefremov/ppa
	sudo apt update
	sudo apt install -y ugene ugene-non-free ugene-data

megax:
	wget https://www.megasoftware.net/do_force_download/megax_10.1.6-1_amd64.deb
	sudo gdebi megax_10.1.6-1_amd64.deb

R16.04:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
	sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/'
	sudo apt update
	sudo apt install -y r-base r-base-dev
	echo "FYI : https://cran.r-project.org/bin/linux/ubuntu/README.html"

R18.04:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
	sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
	sudo apt update
	sudo apt install -y r-base r-base-dev
	echo "FYI : https://cran.r-project.org/bin/linux/ubuntu/README.html"

R20.04_v4.0:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
	sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
	sudo apt update
	sudo apt install -y r-base r-base-dev
	echo "FYI : https://cran.r-project.org/bin/linux/ubuntu/README.html"

RStudio13:
	wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.3.959-amd64.deb
	sudo gdebi rstudio-1.3.959-amd64.deb
	wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh

RStudio14:
	wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.4.1103-amd64.deb
	sudo gdebi rstudio-1.4.1103-amd64.deb
	wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" | sh

Rdepend:
	sudo apt install libgtk2.0-dev xvfb xauth xfonts-base libxt-dev libxml2-dev curl libcurl4-openssl-dev libssl-dev
	sudo apt install -y libgdal-dev libudunits2-dev default-jdk

anaconda:
	wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
	bash Anaconda3-2020.11-Linux-x86_64.sh

cyto3.8:
	wget https://github.com/cytoscape/cytoscape/releases/download/3.8.0/Cytoscape_3_8_0_unix.sh
	bash ./Cytoscape_3_8_0_unix.sh

cyto3.7:
	wget https://github.com/cytoscape/cytoscape/releases/download/3.7.2/Cytoscape_3_7_2_unix.sh
	bash ./Cytoscape_3_7_2_unix.sh

Resilio:
	wget https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz
	mkdir ~/.resilio
	tar xvf resilio-sync_x64.tar.gz -C ~/.resilio
	echo "FYI: https://github.com/Tomonori12/resilio-pi2"

##############################
#          Utilites          #
##############################
utilAll: chrome pdf zoom teamviwer
chrome:
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo gdebi google-chrome-stable_current_amd64.deb

pdf:
	wget http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
	tar xvf FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
	./FoxitReader.enu.setup.2.4.4.0911\(r057d814\).x64.run

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
	mv mendeleydesktop-latest mendeleydesktop-latest.deb
	sudo gdebi mendeleydesktop-latest.deb

flameshot:
	wget https://github.com/lupoDharkael/flameshot/releases/download/v0.6.0/flameshot_0.6.0_xenial_x86_64.deb
	sudo gdebi flameshot_0.6.0_xenial_x86_64.deb

qgis:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51F523511C7028C3
	sudo add-apt-repository "deb [ arch=amd64 ] https://qgis.org/ubuntu `lsb_release -c -s` main"
	sudo apt update
	sudo apt install -y qgis qgis-plugin-grass
	echo "FYI: https://www.qgis.org/ja/site/forusers/alldownloads.html#debian-ubuntu"

synology-drive:
	wget https://global.download.synology.com/download/Tools/SynologyDriveClient/2.0.2-11078/Ubuntu/Installer/x86_64/synology-drive-client-11078.x86_64.deb
	sudo gdebi synology-drive-client-11078.x86_64.deb

mega:
	wget https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb
	wget https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/nautilus-megasync-xUbuntu_20.04_amd64.deb
	sudo gdebi megasync-xUbuntu_20.04_amd64.deb
	sudo gdebi nautilus-megasync-xUbuntu_20.04_amd64.deb

stickynotes:
	sudo add-apt-repository ppa:umang/indicator-stickynotes
	sudo apt update
	sudo apt install -y indicator-stickynotes
	
qgis(2):
	sudo apt install gnupg software-properties-common
	wget -qO - https://qgis.org/downloads/qgis-2020.gpg.key | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import
	sudo chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg
	sudo add-apt-repository "deb https://qgis.org/debian `lsb_release -c -s` main"
	sudo apt update
	sudo apt install qgis qgis-plugin-grass python-qgis
	
grass: #on anaconda environment
	sudo apt-get install grass grass-doc
	conda install -c conda-forge wxpython

synology-drive:
	wget https://global.download.synology.com/download/Tools/SynologyDriveClient/2.0.2-11078/Ubuntu/Installer/x86_64/synology-drive-client-11078.x86_64.deb
	sudo gdebi synology-drive-client-11078.x86_64.deb

mega.nz:
	wget https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb
	sudo gdebi megasync-xUbuntu_20.04_amd64.deb

	
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
Sslack:
	sudo snap install slack --classic
Ssublime:
	sudo snap install sublime-text --classic
Sspotify:
	sudo snap install spotify

#############################
#     flatpak               #
#############################
flatpak:
	@echo "https://flathub.org/home"
	sudo add-apt-repository ppa:alexlarsson/flatpak
	sudo apt update
	sudo apt install -y flatpak
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
