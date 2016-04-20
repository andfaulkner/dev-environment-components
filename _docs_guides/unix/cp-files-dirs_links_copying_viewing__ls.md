#Copy multiple folders into one output folder

		cp -rf folder_one folder_two  backups/
		# =>
			backups/FINALFINAL/folder_one
			backups/FINALFINAL/folder_two

#Create a symbolic link

		ln -s fileToLinkTo newSymbolicLinkName

*		e.g.:
		ln -s /home/andrew/.config/sublime-text-3/Packages/User/snippets/dev-env/.pryrc .pryrc

*   read it as		link THIS to THAT

#View excessive ls output 
ls -lLia

