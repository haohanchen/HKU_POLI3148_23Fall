## Register Github

## Setup Github Authentication in Rstudio

After you have registered on GitHub, the next thing you should do is to
setup your local RStudio so that it can retrieve data from and upload
data to GitHub.

Tools —&gt; Global Option —&gt; Git/SVN

### Step 1: Make a SSH key

*Reader further: [What is a SSH
key?](https://www.ssh.com/academy/ssh-keys)*

Click “Create SSH Key…” Leave all settings as default. You may leave
“Passphrase (optional)” and “Confirm” empty.

<img src="images/paste-EEDE0385.png" width="493" />

<img src="images/paste-B7F8DC6D.png" width="495" />

### Step 2: Copy information of your SSH key

After you have successfully created your SSH key, click “View public
key.” Copy ALL the text in the pop-up window to your clipboard.

<img src="images/paste-74577312.png" width="483" />

<img src="images/paste-14ED5A26.png" width="485" />

### Step 3: Put information of your (public) SSH key in GitHub

## Initiate a New Repo on Github

Click on your profile picture at the top right corner.

<img src="images/Screenshot%202023-09-27%20at%203.10.07%20PM.png"
width="201" />

In the pop-up menu, click “Settings”

<img src="images/Screenshot%202023-09-27%20at%203.10.19%20PM.png"
width="268" />

In the navigation bar located in the column in the left, click ““SSH and
GPG keys.”

<img src="images/Screenshot%202023-09-27%20at%203.10.43%20PM.png"
width="278" />

It will open a page that lists all your existing SSH keys. Click the
button “New SSH key”

<img src="images/Screenshot%202023-09-27%20at%203.11.07%20PM.png"
width="545" />

It will open a page titled “Add new SSH Keys.” In the “Title” field, you
may input any name of your choice (preferably one that tells you which
machine this key is stored). In the “Key” field, input the text you have
copied in RStudio in **Step 2**.

<img src="images/Screenshot%202023-09-27%20at%203.11.51%20PM.png"
width="523" />

Click the green button “Add SSH key” and GitHub will direct you back to
the “SSH Key” page. If your key is added successfully, you should be
able to see its title and information in the “Authentication Keys”
section. You may delete it when it becomes relevant. For your account
security, if you discard a device, you would definitely want to delete
the SSH key associated with it.
