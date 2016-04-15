# Object Explorer for GemStone/S 64

## Intro

**Object Explorer** leverages the work of [Pierre Chanson][15], [Ben Coman][17], and [James Foster][16].

[Pierre Chanson][15] developed [RPointerDetective][2] that was a [Roassal2][4] implementation of [Ben Coman's][17] [PointerDetective][3]. Both [RPointerDetective][2] and [PointerDetective][3] produce grapical representations of the reference path from a *target object* to the persistent roots in a Smalltalk image.

[Pierre Chanson][15] went on to adapt [RPointerDetective][2] for visualizing reference paths for objects in a [GemStone/S 64][12] data base, using [tODE][9] and [GsDevKit_home][10] and produced a [demonstration video of the tool in action][14].

[James Foster][16] developed [ScanBackup][1] to efficiently produce a [report of the instance count for each class][13] in a [GemStone/S 64][12] backup file.

## Object Explorer
**Object Explorer** expands upon this work and provides a tool visualizing and exploring the objects in a [GemStone/S 64][12] repository. 

0. Prerequisites
   - Use a recently updated version of the master branch of GsDevKit_home.
   - The $GS_HOME/shared/repos/tode git repo will be updated to the latest version of the dev branch during installation.

1. Install Object Explorer
   - Create an Object Explorer stone

     ```shell
     cd $GS_HOME/shared/repos
     git clone https://github.com/dalehenrich/obex.git
     createStone -u http://gsdevkit.github.io/GsDevKit_home/Obex.ston -i Obex -l Obex -z $GS_HOME/shared/repos/obex/.smalltalk.ston obex_330 3.3.0
     ```

   - Create an Object Explorer client

     ```shell
     # Create tODE client named obex
     createClient -t pharo obex_40 -l -v Pharo4.0 -s obex_330 -z $GS_HOME/shared/repos/obex/.smalltalk.ston
     startClient obex_40
     ```

2. Log into the stone where you installed the Object Explorer and open an editor on the README from within tODE, so that you can run the examples:

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
     obex view --scan=20
     ```

   - [**Class Instance Count Histogram**](#class-instance-count-histogram): use ojbect inventory to create data for class instance counts; open class instances count histogram:

     ```
     obex inventory
     obex view --inventory=instances limit=10
     ```

   - [**Class Bytes Count Histogram**](#class-bytes-count-histogram): use ojbect inventory to create data for class byte counts; open class bytes count histogram:

     ```
     obex inventory
     obex view --inventory=bytes limit=10
     ```

   - [**Class Instance Count detective**](#class-instance-counts-based-on-selected-set-of-instances)
     ```
     obex instances --classes=3 --passes=0 obex.dbf.gz
     ```

###Object Reference Paths

<img style="border: 2px solid #000000;" src="https://raw.githubusercontent.com/dalehenrich/obex/master/docs/images/sample.png" />

###Class Instance Count Histogram

<img style="border: 2px solid #000000;" src="https://raw.githubusercontent.com/dalehenrich/obex/master/docs/images/classInstances.png" />

###Class Bytes Count Histogram

<img style="border: 2px solid #000000;" src="https://raw.githubusercontent.com/dalehenrich/obex/master/docs/images/classBytes.png" />

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
