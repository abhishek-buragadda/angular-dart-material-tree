import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:angular_components/angular_components.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_icons.dart';

import './model/tree_model.dart';
import './material_tree_node/material_tree_node.dart';
import 'material_tree_service.dart';


@Component(
	selector: 'custom-material-tree',
	styleUrls: const ['material_tree.css'],
	templateUrl: 'material_tree.html',
	directives: const [materialDirectives, COMMON_DIRECTIVES,TreeNodeComponent],
	providers: const [MaterialTreeService]
)
/**
 *   Material Tree Component .
 *
 *   This can be used to create a tree .
 *
 *   Usasge:
 *
 *   <custom-material-tree (nodeSelected)="nodeSelected($event)" [data]="treeRootNodes" >

	</custom-material-tree>

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
 *    	nodeSelected : AsyncAction<<Node> -- emits the node that is clicked.
 *
 *
 */
class CustomMaterialTreeComponent implements OnInit{

	MaterialTreeService _materialTreeService;
	TreeNode selectedNode;
	CustomMaterialTreeComponent(this._materialTreeService);

	StreamController<TreeNode> propagateController = new StreamController<TreeNode>();
	List<TreeNode> rootNodeList = new List<TreeNode>();


	@Output('nodeSelected')
	 Stream get onSelect => propagateController.stream;

	@Input('data')
	dynamic  treeRootNodes;


	@Input("ajaxLoad")
	bool isLoadingViaAjax;

	showChildren(TreeNode node){
		node.showChildren = !node.showChildren;
	}

  @override
  ngOnInit() {
	  for( var node in  treeRootNodes){
		TreeNode treeNode;
	  	 if(isLoadingViaAjax){
			  treeNode = new TreeNode(node.name , null);
		 }else{
			  treeNode = new TreeNode(node.name , node.children);

		 }
		  treeNode.isRoot = true;
		  rootNodeList.add(treeNode);
	  }
  	 _materialTreeService.getNodeController().stream.listen((TreeNode n){
	  	propagateController.add(n);
	  	print(n);
	 });

  }
  @override
  ngOnDestroy(){
  	_materialTreeService.getNodeController().stream.close();
  }
}