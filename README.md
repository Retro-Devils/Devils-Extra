Hi. We're back.

# Devils Extra Info

Devils Extra is a collection of unoffical scripts for RetroPie.

Allowing you to quickly and easily install unoffical emulators, ports and libretrocores. 

These scripts can be considered experimental at best. 

All the things in this github have been tested and work to a degree.
We will do our best to keep this way.

Pull requests and issue reports are accepted and encouraged as well as requests. Feel free to use the issue tracker to send me any personal requests for new scripts that you may have.

## Installation 

The following command clones the repo to your Raspberry Pi directly to the `RetroPie-Setup/ext` folder and runs `RetroPie-Setup/retropie_setup.sh`.

 curl -sSL https://git.io/J9Z8c | bash

The installation script assumes that you are running it on a Raspberry Pi with the `RetroPie-Setup/` folder being stored in `/home/pi/RetroPie-Setup`. If your setup differs, just copy the `Devils-Extra` folder directly to the `/home/pi/RetroPie-Setup/ext` folder.

## Usage

After installing **Devils-Extra**, the extra scripts will be installed directly in the **RetroPie Setup script** (generally in the experimental section), which you can run from either the menu in retropie or
command line with :

cd ~

cd $HOME/RetroPie-Setup/

sudo ./retropie_setup.sh


## Updating

The following commands updates your Raspberry Pi to the latest repo directly to the `RetroPie-Setup/ext` folder.

cd ~

cd $HOME/RetroPie-Setup/ext/Devils-Extra/

git pull origin


**Or if you used installer open terminal and type**

up-extras


## Removing

Open terminal type:

curl -sSL https://bit.ly/3GV8QZg | bash



