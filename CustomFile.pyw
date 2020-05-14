# @author KastenKlicker

import os
from os import path
from tkinter import filedialog
from tkinter import *
from shutil import copyfile
import shutil

#Create Window
custom = Tk()
custom.title("Custom File")

#Select Frame
select = Frame(custom)
select.grid(row=0, column=1)

#Inputbox
var = StringVar()
var.set("MyCustomBuild")

entry = Entry(select, textvariable=var)
entry.grid(row=0, column=2)
name = var.get()

#Create Path exists already window
def path_exists():
        exists = Frame(custom)
        exists.grid(row=0, column=1)

        #Question-Label
        dir = os.path.abspath(name)
        question_label = Label(exists, text="The path " + dir + " exists already. \nDo you want to delete this directory and continue? \n Clicking on No will abort the installation!")
        question_label.grid(row = 0, column = 2)

        #Decision-Buttons
        yes_button = Button(exists, text="Yes", command=accept_action)
        no_button = Button(exists, text="No", command=abort_action)
        yes_button.grid(row = 1, column = 1)
        no_button.grid(row = 1, column = 3)

#Buttons for exists frame           
def abort_action():
    os.system('cmd /k "taskkill /im SpigotInstaller.exe /f && exit"')
    custom.destroy()
    exit()

def accept_action():
    shutil.rmtree(name)
    choose()

#Choose File, write startup.bat and start server for the first time
def choose():
        #Choose File
        os.mkdir(name)
        select.filename =  filedialog.askopenfilename(initialdir = "/",title = "Select file",filetypes = (("jar files","*.jar"),("all files","*.*")))
        copyfile (select.filename, name + "/" + name + ".jar")
        custom.destroy()
        #Generate start.bat
        bat = open(name + "/StartSpigot-" + name + ".bat", "w+")
        bat.write("@echo off \njava -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -Dcom.mojang.eula.agree=true -jar " + name + ".jar \npause")
        bat.close()
        #Starts the server for the first time
        os.system('cmd /k "cd "' + name + '" && @echo off && java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -Dcom.mojang.eula.agree=true -jar "' + name + '".jar && pause && exit"')

#Choose File Button
def button():
        #Check if path exists already
        if path.exists(name):
                #Yes, it does exists
                select.destroy()
                path_exists()
                print("Path exists already!")
                #exit()
                
        else:
                choose()
                print("Choose")
                exit()
                
        

select_button = Button(select, text = "Choose File", command=button)
select_button.grid(row=0, column=5)
instruction_label = Label(select, text = "Enter a name for your server: ").grid(row=0, column=1)

custom.mainloop()
