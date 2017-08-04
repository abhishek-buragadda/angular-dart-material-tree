import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_icons.dart';

import 'service/tree_service.dart';
import 'model/multi_select_tree_model.dart';
import 'multi_select_tree_node/multi_select_tree_node.dart';


/**
 * /**
 *   Material Tree Component .
 *
 *   This can be used to create a tree .
 *
 *   Usasge:
 *
 *   <multi-select-tree (selectedNodes)="nodeSelected($event)" [data]="treeRootNodes" >

	</multi-select-tree>

 *    treeRootNodes= [
 *
 *    {
 *    	name:"parent1",
 *      children:[
 *      	{
 *    		name : "child1"
 *    		children : []
 *
 *    		},
 *    		{
 *    		name : "child2"
 *    		children : []
 *
 *    		},
 *    		{
 *    		name : "child3"
 *    		children : []
 *
 *    		}]
 *    },
 *    {
 *    		name: "parent2",
 *    		children : [
 *    			{
 *    				name : "child5"
 *    				children : []
 *    			},
 *    			{
 *    				name : "child6"
 *    				children : []
 *    			}
 *    			{
 *    				name : "child7"
 *    				children : [
 *    					{
 *    						name : "child8"
 *    						children : []
 *
 *    					},
 *    					{
 *    						name : "child9"
 *    						children : []
 *
 *    					},
 *    					{
 *    						name : "child10"
 *    						children : []
 *    					}]
 *    		    }]
 *    }
 *    ]
 *
 *
 *   __Inputs__
 *
 *     `data : List ` -- List of nodes to be displayed.
 *
 *    __Events__ :
 *
 *    	selectedNodes : AsyncAction<List<List<Node>> -- emits the node that is clicked.
 *
 *
	*/
 *
 *
 */
@Component(
	selector: 'multi-select-tree',
	styleUrls: const ['multi_select_tree.css'],
	templateUrl: 'multi_select_tree.html',
	directives: const [materialDirectives, COMMON_DIRECTIVES, TreeNodeComponent],
	providers: const [TreeService]

)
class MultiSelectTreeComponent implements OnInit{

	TreeService _treeService;
	MultiSelectTreeComponent(this._treeService){
		print("service initialize");
	}

	List<MultiSelectTreeNode> rootNodeList = new List<MultiSelectTreeNode>();
    StreamController<List<MultiSelectTreeNode>> propagateController = new StreamController<List<MultiSelectTreeNode>>();

	@Input('data')
	dynamic  treeRootNodes;

	@Output("selectedNodes")
	Stream get init => propagateController.stream;

	@override
	ngOnInit() {

	  for( var node in  treeRootNodes){
		  MultiSelectTreeNode treeNode;
		  treeNode = new MultiSelectTreeNode(node.name ,node.showOtherProperties, node.children);
		  treeNode.isRoot = true;
		  rootNodeList.add(treeNode);
	  }
	  this._treeService.streamController.stream.listen((List<MultiSelectTreeNode> n){
	  		propagateController.add(n);
	  });



	}

	@override
	ngOnDestroy(){
		propagateController.close();
	}
}



