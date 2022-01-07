const arr = [7,8,3,5,2,6,9]
const items = [
  {
    idn: '#v0',
    idt: '#t0',
    val: '41'
  },
  {
    idn: '#v1',
    idt: '#t1',
    val: '20'
  },
  {
    idn: '#v3',
    idt: '#t3',
    val: '34'
  },
  {
    idn: '#v2',
    idt: '#t2',
    val: '65'
  },
  {
    idn: '#v4',
    idt: '#t4',
    val: '50'
  },
  {
    idn: '#v5',
    idt: '#t5',
    val: '68'
  },
  {
    idn: '#v6',
    idt: '#t6',
    val: '10'
  }
]
const heading1 = document.getElementById('heading1')
const heading2 = document.getElementById('heading2')
const heading3 = document.getElementById('heading3')
const input = document.querySelector('#input')

class Node {
  constructor(data, left = null, right = null) {
    this.data = data
    this.left = left
    this.right = right
  }
  // Thực hiện tạo 1 node
}
class BST {
  //khởi tạo node
  constructor() {
    this.root = null
  }
  add(data) { //hàm thêm node vào cây
    const node = this.root;
    if (node === null) {     //nếu cây chưa có node thì sẽ tạo node đầu tiên 
      this.root = new Node(data);
      return
    } else {
      const searchTree = function (node) { //nếu đã có cây thì sẽ tìm vị trí cho node được thêm
        if (data < node.data) { // nếu data bé hơn giá trị của node hiện tại thì đưa sang trái đệ quy
          if (node.left === null) {// nếu chưa có thì tạo node 
            node.left = new Node(data)
            return
          } else if (node.left !== null) { //nếu đã có thì tiếp tục tìm
            return searchTree(node.left)
          }
        } else if (data > node.data) { // nếu data bé hơn giá trị của node hiện tại thì đưa sang phải đệ quy
          if (node.right === null) {
            node.right = new Node(data)
            return
          } else if (node.right !== null) {
            return searchTree(node.right)
          }
        } else {
          return null
        }
      }
      return searchTree(node)
    }
  }
  inOrder() { // Duyệt LNR
    if (this.root == null) {
      return null;
    } else {
      var result = new Array();
      function traverseInOrder(node) {
        node.left && traverseInOrder(node.left);
        result.push(node.data);
        node.right && traverseInOrder(node.right);
      }
      traverseInOrder(this.root);
      return result;
    };
  }
  preOrder() { // duyệt NLR
    if (this.root == null) {
      return null;
    } else {
      var result = new Array();
      function traversePreOrder(node) {
        result.push(node.data);
        node.left && traversePreOrder(node.left);
        node.right && traversePreOrder(node.right);
      };
      traversePreOrder(this.root);
      return result;
    };
  }
  postOrder() { // duyệt LRN
    if (this.root == null) {
      return null;
    } else {
      var result = new Array();
      function traversePostOrder(node) {
        node.left && traversePostOrder(node.left);
        node.right && traversePostOrder(node.right);
        result.push(node.data);
      };
      traversePostOrder(this.root);
      return result;
    }
  }
  find(data){
    let current = this.root
    let parent
    while(current.data !== data) {
      if(data < current.data){
        parent = current
        current = current.left
      }else {
        parent = current
        current = current.right
      }
      if(current === null){
        return null
      }
    }
    return {parent,current}
  }
}

const hightlightCircle = (node,i) => {
  const z = items.filter((item) => item.val == node)
  console.log(z[0].val)
  setTimeout(() => {
    const id = d3.select(z[0].idn)
    const text = d3.select(z[0].idt)
    id.transition()
      .duration(1000)
      .attr('stroke', '#ff8a27')
    text.transition()
      .duration(1000)
      .attr('fill', '#ff8a27')
  }, (i * 1000) + 500)
}

const offCircle = (node,i) => {
  const z = items.filter((item) => item.val == node)
    const id = d3.select(z[0].idn)
    const text = d3.select(z[0].idt)
    id.transition()
      .attr('stroke', '#333333')
    text.transition()
      .attr('fill', '#333')
}

// const h
const insertNode = () => {
    const node = input.value
    bst.add(node)
    const result = bst.find(node)
    const parent = result.parent
    const children = result.current
    const z = items.filter((item) => item.val == parent.data)
    const x = items.filter((item) => item.val == children.data)
    const g = document.querySelector(z[0].idn)
    console.log(g)

}

const bst = new BST()
for (i = 0; i < arr.length; i++) {
  bst.add(arr[i])
}
const r = bst.root.right
const x = bst.inOrder()
const c = bst.preOrder()
const y = bst.postOrder()
console.log('LNR: ',x)
console.log('LRN: ',y)
console.log('NLR: ',c)
const traversalInorder = () => {
  for (var i = 0;i<x.length;i++) {
    offCircle(x[i],i)
  }
  for (var i = 0;i<x.length;i++) {
    hightlightCircle(x[i],i)
  }
  setTimeout(() => {
    heading1.innerHTML = `inOrder: [${x}]`
  }, (x.length * 1000) + 500 )
}
const traversalPreorder = () => {
  for (var i = 0;i<x.length;i++) {
    offCircle(x[i],i)
  }
  for (var i = 0;i<c.length;i++) {
    hightlightCircle(c[i],i)
  }
  setTimeout(() => {
    heading2.innerHTML = `Preoder: [${c}]`
  }, (x.length * 1000) + 500)
}
const traversalPostoder = () => {
  for (var i = 0;i<x.length;i++) {
    offCircle(x[i],i)
  }
  for (var i = 0;i<y.length;i++) {
    hightlightCircle(y[i],i)
  }
  setTimeout(() => {
    heading3.innerHTML = `Postoder: [${y}]`
  }, (x.length * 1000) + 500)
}

