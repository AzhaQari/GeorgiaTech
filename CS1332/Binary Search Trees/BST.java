import java.util.NoSuchElementException;
import java.util.Queue;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Collection;
import java.util.List;


/**
 * Your implementation of a BST.
 *
 * @author Azha Qari
 * @version 1.0
 * @userid aqari3
 * @GTID 903481053
 *
 * Collaborators: I worked alone
 *
 * Resources: Course materials, stackoverflow, youtube bst tutorials
 */
public class BST<T extends Comparable<? super T>> {

    // Do not add new instance variables or modify existing ones.
    private BSTNode<T> root;
    private int size;

    /**
     * Constructs a new BST.
     *
     * This constructor should initialize an empty BST.
     *
     * Since instance variables are initialized to their default values, there
     * is no need to do anything for this constructor.
     */
    public BST() {
        // DO NOT IMPLEMENT THIS CONSTRUCTOR!
    }

    /**
     * Constructs a new BST.
     *
     * This constructor should initialize the BST with the data in the
     * Collection. The data should be added in the same order it is in the
     * Collection.
     *
     * Hint: Not all Collections are indexable like Lists, so a regular for loop
     * will not work here. However, all Collections are Iterable, so what type
     * of loop would work?
     *
     * @param data the data to add to the tree
     * @throws java.lang.IllegalArgumentException if data or any element in data
     *                                            is null
     */
    public BST(Collection<T> data) {
        if (data == null || data.contains(null)) {
            throw new java.lang.IllegalArgumentException("The data or an element in the data is null.");
        }
        //size = 0;
        for (T d: data) {
            add(d);
        }
    }

    /**
     * Adds the element to the tree.
     *
     * The data becomes a leaf in the tree.
     *
     * Traverse the tree to find the appropriate location. If the data is
     * already in the tree, then nothing should be done (the duplicate
     * shouldn't get added, and size should not be incremented).
     *
     * Must be O(log n) for a balanced tree and O(n) for worst case.
     * 
     * This method must be implemented recursively.
     *
     * @param data the data to add
     * @throws java.lang.IllegalArgumentException if data is null
     */
    public void add(T data) {
        if (data == null) {
            throw new java.lang.IllegalArgumentException("The data is null.");
        }
        if (root == null) {
            size++;
            root = new BSTNode<>(data);
        } else {
            addNode(root, data);
        }
    }

    /**
     * Recursive helper method for the add method above^^^
     *
     * @param node the root of the tree/subtrees
     * @param data the data to add to the tree
     */
    private void addNode(BSTNode<T> node, T data) {
        if (data.compareTo(node.getData()) < 0) {
            if (node.getLeft() == null) {
                node.setLeft(new BSTNode<>(data));
                size++;
            } else {
                addNode(node.getLeft(), data);
            }
        } else if (data.compareTo(node.getData()) > 0) {
            if (node.getRight() == null) {
                node.setRight(new BSTNode<>(data));
                size++;
            } else {
                addNode(node.getRight(), data);
            }
        } else if (data.compareTo(node.getData()) == 0) {
            return;
        }
    }


    /**
     * Removes and returns the element from the tree matching the given
     * parameter.
     *
     * There are 3 cases to consider:
     * 1: The node containing the data is a leaf (no children). In this case,
     * simply remove it.
     * 2: The node containing the data has one child. In this case, simply
     * replace it with its child.
     * 3: The node containing the data has 2 children. Use the predecessor to
     * replace the data. You MUST use recursion to find and remove the
     * predecessor (you will likely need an additional helper method to
     * handle this case efficiently).
     *
     * Do not return the same data that was passed in. Return the data that
     * was stored in the tree.
     *
     * Hint: Should you use value equality or reference equality?
     *
     * Must be O(log n) for a balanced tree and O(n) for worst case.
     * 
     * This method must be implemented recursively.
     *
     * @param data the data to remove
     * @return the data that was removed
     * @throws java.lang.IllegalArgumentException if data is null
     * @throws java.util.NoSuchElementException   if the data is not in the tree
     */
    public T remove(T data) {
        if (data == null) {
            throw new java.lang.IllegalArgumentException("The data is null.");
        }

        BSTNode<T> dummyNode = new BSTNode<>(null);
        root = deleteNode(root, dummyNode, data);

        return dummyNode.getData();
    }
    /**
     * Recursive method that actually removes the node we are looking for
     *
     * @throws java.util.NoSuchElementException if the data is not found
     * @param node the current node that we traversed to
     * @param dummyNode stores the data to be removed
     * @param data the data to remove from the tree
     * @return parent node of node that will get removed
     */
    private BSTNode<T> deleteNode(BSTNode<T> node, BSTNode<T> dummyNode, T data) {
        if (node == null) {
            throw new NoSuchElementException("Data is not in the tree");
        } else {
            if (data.compareTo(node.getData()) < 0) {
                node.setLeft(deleteNode(node.getLeft(), dummyNode, data));
            } else if (data.compareTo(node.getData()) > 0) {
                node.setRight(deleteNode(node.getRight(), dummyNode, data));
            } else {
                size--;
                dummyNode.setData(node.getData());

                if (node.getLeft() == null) {
                    return node.getRight();
                } else if (node.getRight() == null) {
                    return node.getLeft();
                } else {
                    BSTNode<T> predecessor = new BSTNode<T>(null);

                    node.setLeft(predecessorHelper(predecessor, node.getLeft()));
                    node.setData(predecessor.getData());
                }
            }
        }
        return node;
    }
    /**
     * Helper method for deleteNode(): it helps find the predecessor to a given node
     *
     * @param predecessor the child of a node that will be removed
     * @param node the current node
     * @return returns the predecessor node
     */
    private BSTNode<T> predecessorHelper(BSTNode<T> predecessor, BSTNode<T> node) {
        if (node.getRight() == null) {
            predecessor.setData(node.getData());
            return node.getLeft();
        }

        node.setRight(predecessorHelper(predecessor, node.getRight()));

        return node;
    }

    /**
     * Returns the element from the tree matching the given parameter.
     *
     * Hint: Should you use value equality or reference equality?
     *
     * Must be O(log n) for a balanced tree and O(n) for worst case.
     * 
     * This method must be implemented recursively.
     *
     * Do not return the same data that was passed in. Return the data that
     * was stored in the tree.
     *
     * @param data the data to search for in the tree
     * @return the data in the tree equal to the parameter
     * @throws java.lang.IllegalArgumentException if data is null
     * @throws java.util.NoSuchElementException   if the data is not in the tree
     */
    public T get(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Data can't be null.");
        }

        return getHelper(root, data);
    }
    /**
     * Recursive helper method for get(T data)
     *
     * @param node the root node to start searching from
     * @param data the data we are trying to get
     * @return returns the data from the node that has the data we are looking for
     */
    private T getHelper(BSTNode<T> node, T data) {
        if (data.compareTo(node.getData()) == 0) {
            return node.getData();
        } else if (data.compareTo(node.getData()) < 0) {
            if (node.getLeft() != null) {
                return getHelper(node.getLeft(), data);
            } else {
                throw new NoSuchElementException("The data is not in the tree.");
            }
        } else {
            if (node.getRight() != null) {
                return getHelper(node.getRight(), data);
            } else {
                throw new NoSuchElementException("The data is not in the tree.");
            }
        }
    }

    /**
     * Returns whether or not data matching the given parameter is contained
     * within the tree.
     *
     * Hint: Should you use value equality or reference equality?
     *
     * Must be O(log n) for a balanced tree and O(n) for worst case.
     * 
     * This method must be implemented recursively.
     *
     * @param data the data to search for in the tree.
     * @return true if the parameter is contained within the tree, false
     * otherwise
     * @throws java.lang.IllegalArgumentException if data is null
     */
    public boolean contains(T data) {
        if (data == null) {
            throw new IllegalArgumentException("Data can't be null.");
        }
        /*
        if (get(data).equals(data)) {
            return true;
        } else {
            return false;
        }
         */
        return (get(data).equals(data));

    }

    /**
     * Generate a pre-order traversal of the tree.
     *
     * Must be O(n).
     *
     * This method must be implemented recursively.
     *
     * @return the preorder traversal of the tree
     */
    public List<T> preorder() {
        ArrayList<T> list = new ArrayList<>();
        preorderHelper(root, list);
        return list;
    }
    /**
     * Recursive helper method for preorder()
     *
     * @param node the root node of the tree/subtree
     * @param list the list that stores the data from the nodes
     */
    private void preorderHelper(BSTNode<T> node, ArrayList<T> list) {
        if (node != null)   {
            list.add(node.getData());
            preorderHelper(node.getLeft(), list);
            preorderHelper(node.getRight(), list);
        } else {
            return;
        }
    }
    /**
     * Generate a in-order traversal of the tree.
     *
     * Must be O(n).
     * 
     * This method must be implemented recursively.
     *
     * @return the inorder traversal of the tree
     */
    public List<T> inorder() {
        ArrayList<T> list = new ArrayList<>();
        inorderHelper(root, list);
        return list;
    }
    /**
     * Recursive helper method for inorder()
     *
     * @param node the root node of the tree/subtree
     * @param list the list that stores the data from the nodes
     */
    private void inorderHelper(BSTNode<T> node, ArrayList<T> list) {
        if (node != null)   {
            inorderHelper(node.getLeft(), list);
            list.add(node.getData());
            inorderHelper(node.getRight(), list);
        } else {
            return;
        }
    }

    /**
     * Generate a post-order traversal of the tree.
     *
     * Must be O(n).
     * 
     * This method must be implemented recursively.
     *
     * @return the postorder traversal of the tree
     */
    public List<T> postorder() {
        ArrayList<T> list = new ArrayList<>();
        postorderHelper(root, list);
        return list;
    }
    /**
     * Recursive helper method for postorder()
     *
     * @param node the root node of the tree/subtree
     * @param list the list that stores the data from the nodes
     */
    private void postorderHelper(BSTNode<T> node, ArrayList<T> list) {
        if (node != null)   {
            postorderHelper(node.getLeft(), list);
            postorderHelper(node.getRight(), list);
            list.add(node.getData());
        } else {
            return;
        }
    }

    /**
     * Generate a level-order traversal of the tree.
     *
     * This does not need to be done recursively.
     *
     * Hint: You will need to use a queue of nodes. Think about what initial
     * node you should add to the queue and what loop / loop conditions you
     * should use.
     *
     * Must be O(n).
     *
     * @return the level order traversal of the tree
     */
    public List<T> levelorder() {
        Queue<BSTNode<T>> queue = new LinkedList<>();
        ArrayList<T> list = new ArrayList<>();

        queue.add(root);

        while (!queue.isEmpty()) {
            BSTNode<T> node = queue.remove();
            if (node != null) {
                list.add(node.getData());
                queue.add(node.getLeft());
                queue.add(node.getRight());
            }
        }
        return list;
    }

    /**
     * Returns the height of the root of the tree.
     *
     * A node's height is defined as max(left.height, right.height) + 1. A
     * leaf node has a height of 0 and a null child should be -1.
     *
     * Must be O(n).
     * 
     * This method must be implemented recursively.
     *
     * @return the height of the root of the tree, -1 if the tree is empty
     */
    public int height() {
        return heightHelper(root);
    }
    /**
     * Recursive helper method for height()
     *
     * @param node the starting node that we are finding the height for
     * @return returns the height of the passed in node
     */
    private int heightHelper(BSTNode<T> node) {
        if (node != null) {
            return (Math.max(heightHelper(node.getLeft()), heightHelper(node.getRight())) + 1);
        } else {
            return -1;
        }
    }

    /**
     * Clears the tree.
     *
     * Clears all data and resets the size.
     *
     * Must be O(1).
     */
    public void clear() {
        size = 0;
        root = null;
    }

    /**
     * This method checks whether a binary tree meets the criteria for being
     * a binary search tree.
     *
     * This method is a static method that takes in a BSTNode called
     * {@code treeRoot}, which is the root of the tree that you should check.
     *
     * You may assume that the tree passed in is a proper binary tree; that is,
     * there are no loops in the tree, the parent-child relationship is
     * correct, that there are no duplicates, and that every parent has at
     * most 2 children. So, what you will have to check is that the order
     * property of a BST is still satisfied.
     *
     * Should run in O(n). However, you should stop the check as soon as you
     * find evidence that the tree is not a BST rather than checking the rest
     * of the tree.
     * 
     * This method must be implemented recursively.
     *
     * @param <T> the generic typing
     * @param treeRoot the root of the binary tree to check
     * @return true if the binary tree is a BST, false otherwise
     */
    public static <T extends Comparable<? super T>> boolean isBST(
            BSTNode<T> treeRoot) {
        return isBSTHelper(treeRoot, null, null);
    }
    /**
     * Recursive helper method for isBST(BSTNode treeRoot)
     *
     * @param treeRoot the root of the tree/where to start checking from
     * @param l the left node pointer
     * @param r the right node pointer
     * @param <T> generics type variable/object
     * @return returns true or false regarding whether the tree is a BST or not
     */
    private static <T extends Comparable<? super T>> boolean isBSTHelper(
            BSTNode<T> treeRoot, T l, T r) {
        if (treeRoot != null) {
            if (treeRoot.getData().compareTo(l) < 0 && l != null) {
                return false;
            }
            if (treeRoot.getData().compareTo(r) > 0 && r != null) {
                return false;
            }
            return isBSTHelper(treeRoot.getLeft(), l, treeRoot.getData())
                    && isBSTHelper(treeRoot.getRight(), r, treeRoot.getData());
        } else {
            return true;
        }


    }

    /**
     * Returns the root of the tree.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the root of the tree
     */
    public BSTNode<T> getRoot() {
        // DO NOT MODIFY THIS METHOD!
        return root;
    }

    /**
     * Returns the size of the tree.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the size of the tree
     */
    public int size() {
        // DO NOT MODIFY THIS METHOD!
        return size;
    }
}
