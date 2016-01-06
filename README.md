# Object Explorer for GemStone/S 64

## Intro

**Object Explorer** leverages the work of [Pierre Chanson][15], [Ben Coman][17], and [James Foster][16].

[Pierre Chanson][15] developed [RPointerDetective][2] that was a [Roassal2][4] implementation of [Ben Coman's][17] [PointerDetective][3]. Both [RPointerDetective][2] and [PointerDetective][3] produce grapical representations of the reference path from a *target object* to the persistent roots in a Smalltalk image.

[Pierre Chanson][15] went on to adapt [RPointerDetective][2] for visualizing reference paths for objects in a [GemStone/S 64][12] data base, using [tODE][9] and [GsDevKit_home][10] and produced a [demonstration video of the tool in action][14].

[James Foster][16] developed [ScanBackup][1] to efficiently produce a [report of the instance count for each class][13] in a [GemStone/S 64][12] backup file.

## Object Explorer
**Object Explorer** expands upon this work and provides a tool visualizing and exploring the objects in a [GemStone/S 64][12] repository. 

0. Prerequisites
   1. Using a recently updated version of GsDevKit_home
   2. Using the dev branch of tODE (installation instructions include info for updating to dev version).

1. Install Object Explorer
   - [install in Server](#gsdevkithome-server)
   - [install in Client](#gsdevkithome-client)

2. Log into the stone where you installed the Object Exploer and open an editor on the README from within tODE, so that you can run the examples:

   ```
   edit /sys/stone/dirs/Obex/README.md
   ```

2. Take the Object Explorer for a quick spin:
   - [**Pointer Detective**](#object-reference-paths): calculate reference paths; open interactive detective view:

     ```
     obex calc --maxPaths=3 --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`
     obex view --detective
     ```

   - [**Class Instance Count Histogram**](#class-instance-count-histogram): create and scan backup for class instance counts; open class instance count histogram:

     ```
     obex scan --backup obex.dbf.gz
     obex view --classes=20
     ```

###Installation
**Note: this project is under active developement and may undergo significant changes without notice ... with that said, if you are fighting an object leak issue, then feel free to use the tool and provide feedback.**

In order to use Object Explorer, you need to install [GsDevKit_home](https://github.com/GsDevKit/GsDevKit_home#installation) so that tODE is installed. 

#### GsDevKit_home Server
After the initial installation, execute the following bash commands:

```shell
cd $GS_HOME/shared/repos/tode
git checkout dev
git pull origin dev
```

Execute the following tODE commands:

```
project install --url=http://gsdevkit.github.io/GsDevKit_home/Obex.ston
project load Obex
edit /sys/stone/dirs/Obex/README.md
```

Then execute the following bash commands:

```
cp $GS_HOME/shared/repo/obex/gsDevKit/local/gsdevkit_bin/* $GS_HOME/sys/local/gsdevkit_bin
```

To update using the `project list`:

  - with the `Obex` project selected, use the `Git >> pull` menu item, the the `load` menu item.

#### GsDevKit_home Client
If Server is running on a remote host, then execute the following Bash on the client machine:

```shell
cd $GS_HOME/shared/repos/tode
git checkout dev
git pull origin dev
cd ..
git clone git@github.com:dalehenrich/obex.git
cp $GS_HOME/shared/repo/obex/gsDevKit/local/gsdevkit_bin/* $GS_HOME/sys/local/gsdevkit_bin
```

Then in a workspace in the client (use the `Pharo >> Pharo World Menu` to enable the Pharo System Menu and use `tODE World Menu` to restore tODE System Menu) execute the following (ignore the GT* warnings):

```Smalltalk
| gs_home |
gs_home := Smalltalk os environment at: 'GS_HOME'.
Metacello new
  baseline: 'Obex';
  repository: 'filetree://', gs_home, '/shared/repos/obex/repository';
  load: 'Core'
```

To update the client:

  - With a remote server update the git repo:

    ```shell
    cd $GS_HOME/shared/repos/obex
    git pull origin master
    ```
  - in a client workspace, execute:  

    ```Smalltalk
    Metacello image baseline: 'Obex'; get; load
    ```

###Object Reference Paths

<img style="border: 2px solid #000000;" src="https://raw.githubusercontent.com/dalehenrich/obex/master/docs/images/sample.png" />

###Class Instance Histogram

<img style="border: 2px solid #000000;" src="https://raw.githubusercontent.com/dalehenrich/obex/master/docs/images/classInstances.png" />

###Class Instance Counts based on selected set of instances

Each of the green nodes in the graph the instance count of the listed class in the image. The parent nodes of the green nodes (to the right) list the instance count of the classes that **reference** the instances in the child node ... and so on.

<img style="border: 2px solid #000000;" src="https://raw.githubusercontent.com/dalehenrich/obex/master/docs/images/classInstancesWithInstances.png" />

When you click on a brown node, the parent nodes (i.e., class instance counts for the instances associated with the node) is calculated and displayed,

**Stay tuned for further work, as this project is still under development**


[1]: http://seaside.gemtalksystems.com/ss/ScanBackup.html
[2]: http://www.smalltalkhub.com/#!/~PierreChanson/RPointerDetective
[3]: http://smalltalkhub.com/#!/~BenComan/PointerDetective
[4]: http://smalltalkhub.com/#!/~ObjectProfile/Roassal2

[9]: https://github.com/dalehenrich/tode
[10]: https://github.com/GsDevKit/GsDevKit_home

[12]: https://gemtalksystems.com/products/gs64/

[13]: https://programminggems.wordpress.com/2009/05/14/scanbackup/

[14]: https://vimeo.com/131145038

[15]: https://fr.linkedin.com/in/pierre-chanson-7a817064
[16]: https://github.com/jgfoster
[17]: https://github.com/bencoman
