// Copyright (c) 2017, aburagad. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';

import 'package:angular_dart_material_tree/src/model/tree_model.dart';
import 'package:angular_dart_material_tree/src/material-tree/material_tree.dart';
import 'package:angular_dart_material_tree/src/multi_select_tree/multi_select_tree.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, COMMON_DIRECTIVES,CustomMaterialTreeComponent, MultiSelectTreeComponent],
  providers: const [materialProviders],
)
class AppComponent  implements OnInit{

  List<TreeNode> treeRootNodes;
  List<String> selectedNodes = new List<String>();
  dynamic emittedNodes;
  String selectedNode;
  getTreeData(){

    List<TreeNode> rootNodeList = new List<TreeNode>();
    TreeNode t1 = new TreeNode();
    t1.name="parent1";
    TreeNode t2 = new TreeNode();
    t2.name = "child1";
    TreeNode t3 = new TreeNode();
    t3.name = "child2";
    TreeNode t4 = new TreeNode();
    t4.name = "child3";
    TreeNode t5 = new TreeNode();
    t5.name = "child4";
    TreeNode t6 = new TreeNode();
    t6.name = "child5";
    TreeNode t7 = new TreeNode();
    t7.name = "child6";
    TreeNode t8 = new TreeNode();
    t8.name = "child7";
    TreeNode t9 = new TreeNode();
    t9.name = "child9";
    t9.showOtherProperties=true;
    TreeNode t10 = new TreeNode();
    t10.name = "child10";
    TreeNode t11 = new TreeNode();
    t11.name = "child11";
    t11.showOtherProperties= true ;
    t8.children..add(t9)
      ..add(t10)
      ..add(t11);

    t1.children..add(t2)
      .. add(t3)
      ..add(t4);

    t5.children..add(t6)
      ..add(t7)
      ..add(t8);


    rootNodeList.add(t1);
    rootNodeList.add(t5);

    return rootNodeList;


  }


  nodeSelected(TreeNode  node ){
	  selectedNode = node.name ;
  }

  nodesSelected(nodes){
	  this.emittedNodes = nodes;
	  selectedNodes= new List<String>();
	  for(var node in nodes){
		  selectedNodes.add(node.name);
	  }
  }


  @override
  ngOnInit() {
    // TODO: implement ngOnInit

    this.treeRootNodes = getTreeData();
  }

}
