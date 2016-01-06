# Object Explorer for GemStone/S 64

## Intro

**Object Explorer** leverages the work of [Pierre Chanson][15], [Ben Coman][17], and [James Foster][16].

[Pierre Chanson][15] developed [RPointerDetective][2] that was a [Roassal2][4] implementation of [Ben Coman's][17] [PointerDetective][3]. Both [RPointerDetective][2] and [PointerDetective][3] produce grapical representations of the reference path from a *target object* to the persistent roots in a Smalltalk image.

[Pierre Chanson][15] went on to adapt [RPointerDetective][2] for visualizing reference paths for objects in a [GemStone/S 64][12] data base, using [tODE][9] and [GsDevKit_home][10] and produced a [demonstration video of the tool in action][14].

[James Foster][16] developed [ScanBackup][1] to efficiently produce a [report of the instance count for each class][13] in a [GemStone/S 64][12] backup file.

## Object Explorer
**Object Explorer** expands upon this work and provides a tool visualizing and exploring the objects in a [GemStone/S 64][12] repository. 

###Installation

#### GsDevKit_home Server
Execute the following tODE commands:

```
project install --url=http://gsdevkit.github.io/GsDevKit_home/Obex.ston
project load Obex
```

To update using the `project list`:

  - with the `Obex` project selected, use the `Git >> pull` menu item, the the `load` menu item.

#### GsDevKit_home Client
If Server is running on a remote host, then execute the following Bash on the client machine:

```shell
cd $GS_HOME/shaed/repos
git clone git@github.com:dalehenrich/obex.git
```

Then in a workspace in the client (use the `Pharo >> Pharo World Menu` to enable the Pharo System Menu and use `tODE World Menu` to restore tODE System Menu) execute the followg:

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
