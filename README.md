# angular_dart_material_tree

[demo](https://abhishek-buragadda.github.io/angular-dart-material-tree/)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.
   
   ```
    1. clone 
    2. pub get 
    3. pub serve 
    
   ```
    

### Prerequisites

#### Dart packages

* Polymer
* Polymer elements

```
dependencies :
  polymer: 1.0.0-rc.19
  polymer_elements: 1.0.0-rc.10

```

### Installing

Update you pubspec.yaml file to include the above dependencies . 
Include multi_select_tree dependency in the pub-spec.yaml file. 

  multi_select_tree: "^1.0.0"

Include the material-tree/multi-select-tree in the imports .
```
import 'package:angular_dart_data_grid/src/material-tree/material-tree.dart';
```
Add the CustomMaterialTreeComponent in the  directives  for material_tree
```
  directives: const [materialDirectives, CustomMaterialTreeComponent],
```

Add the MultiSelectTreeComponent in the  directives  for multi_select_tree 
```
  directives: const [materialDirectives, MultiSelectTreeComponent],
```


Get the dependecies and run pub build/serve. 


### Using it in the HTML. 

#### Inputs :

    `data : List<>` 
          -- Data to be displayed in the tree. Expecting a list here.
       Example:   
  ```     
  treeRootNodes= 
  [
    {
     	name: "parent1" ,
      children:[
       	{
     		name : "child1"
     		children : []
 
     		},
     		{
     		name : "child2"
     		children : []
 
     		},
     		{
     		name : "child3"
     		children : []
     		}]
     },
     {
     		name: "parent2",
     		children : [
     			{
     				name : "child5"
     				children : []
     			},
     			{
     				name : "child6"
     				children : []
     			}
     			{
     				name : "child7"
     				children : [
     					{
     						name : "child8"
     						children : []
 
     					},
     					{
     						name : "child9"
     						children : []
 
     					},
     					{
     						name : "child10"
     						children : []
     					}]
     		    }]
     }
     ]
 ```
  #### Events :
      
      	nodeSelected : AsyncAction<<Node> -- emits the node that is clicked.
 
	 
 #### Material Tree Usage : 
 
```
<custom-material-tree (nodeSelected)="nodeSelected($event)" [data]="treeRootNodes" >

	</custom-material-tree>

```

We can write any function in order to handle the emitted event. I wrote a dummy function nodeSelected which will get the selected node as an arguement automcatically. 

The above example will show the checkboxes for each of the row, add/delete button and columns as per the column definitions.

### Multi-Select Tree Usage :
   ```
     <multi-select-tree (selectedNodes)="nodeSelected($event)" [data]="treeRootNodes" >
	   </multi-select-tree>
   ```
   ### Inputs : 
   
   same as material-tree.
   
   ### Events :
      	selectedNodes : AsyncAction<<List<Node>> -- emits the selected  nodes.
   
