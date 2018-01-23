from kalilinux/kali-linux-docker:latest
RUN apt-get -y update && \
	    apt-get -y upgrade && \
	    apt-get install -y aircrack-ng pciutils
RUN apt-get install -y kali-linux && \
	    apt-get install -y kali-linux-wireless && \
	    apt-get -y install kali-linux-top10
#Por network chipset macbookpro
RUN apt-get update; apt-get install broadcom-sta-dkms; apt-get install \
 linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed's,[^-]*-[^-]*-,,') broadcom-sta-dkms
