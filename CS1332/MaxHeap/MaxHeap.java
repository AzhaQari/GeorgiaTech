import java.util.ArrayList;
import java.util.NoSuchElementException;

/**
 * Your implementation of a MaxHeap.
 *
 * @author Azha Qari
 * @version 1.0
 * @userid aqari3
 * @GTID 903481053
 *
 * Collaborators: I worked alone on this
 *
 * Resources: stackoverflow
 */
public class MaxHeap<T extends Comparable<? super T>> {

    /*
     * The initial capacity of the MaxHeap when created with the default
     * constructor.
     *
     * DO NOT MODIFY THIS VARIABLE!
     */
    public static final int INITIAL_CAPACITY = 13;

    /*
     * Do not add new instance variables or modify existing ones.
     */
    private T[] backingArray;
    private int size;

    /**
     * Constructs a new MaxHeap.
     *
     * The backing array should have an initial capacity of INITIAL_CAPACITY.
     */
    public MaxHeap() {
        backingArray = (T[]) new Comparable[INITIAL_CAPACITY];
        size = 0;
    }

    /**
     * Creates a properly ordered heap from a set of initial values.
     *
     * You must use the BuildHeap algorithm that was taught in lecture! Simply
     * adding the data one by one using the add method will not get any credit.
     * As a reminder, this is the algorithm that involves building the heap
     * from the bottom up by repeated use of downHeap operations.
     *
     * Before doing the algorithm, first copy over the data from the
     * ArrayList to the backingArray (leaving index 0 of the backingArray
     * empty). The data in the backingArray should be in the same order as it
     * appears in the passed in ArrayList before you start the BuildHeap
     * algorithm.
     *
     * The backingArray should have capacity 2n + 1 where n is the
     * number of data in the passed in ArrayList (not INITIAL_CAPACITY).
     * Index 0 should remain empty, indices 1 to n should contain the data in
     * proper order, and the rest of the indices should be empty.
     *
     * @param data a list of data to initialize the heap with
     * @throws java.lang.IllegalArgumentException if data or any element in data
     *                                            is null
     */
    public MaxHeap(ArrayList<T> data) {
        if (data == null) {
            throw new IllegalArgumentException("The data cannot be null.");
        }
        backingArray = (T[]) new Comparable[2 * data.size() + 1];
        size = data.size();
        for (int i = 0; i < data.size(); i++) {
            if (data.get(i) == null) {
                throw new IllegalArgumentException("The data cannot be null.");
            }
            backingArray[i + 1] = data.get(i);

        }

        for (int i = size / 2; i >= 1; i--) {
            addHelp(i);
        }
    }

    /**
     * Adds the data to the heap.
     *
     * If sufficient space is not available in the backing array (the backing
     * array is full except for index 0), resize it to double the current
     * length.
     *
     * @param data the data to add
     * @throws java.lang.IllegalArgumentException if data is null
     */
    public void add(T data) {
        if (data == null) {
            throw new IllegalArgumentException("The data cannot be null");
        }
        if (size >= backingArray.length - 1) {
            resizeArray();
        }
        size++;
        backingArray[size] = data;
        swapHelp(size);
    }

    /**
     * helper method for when we need to swap added elemenents within the heap
     *
     * @param i the size of heap
     */
    private void swapHelp(int i) {
        if (i == 1) {
            return;
        }
        if (backingArray[i / 2].compareTo(backingArray[i]) < 0) {
            swap(i / 2, i);
            swapHelp(i / 2);
        }
    }
    /**
     * Helper method for when we are adding elements to the heap
     *
     * @param i the index of elements
     */
    private void addHelp(int i) {
        int left = 2 * i + 1;
        int right = 2 * i;
        int temp = i;

        if (left <= size
                && backingArray[left].compareTo(backingArray[temp]) > 0) {
            temp = left;
        }
        if (right <= size
                && backingArray[right].compareTo(backingArray[temp]) > 0) {
            temp = right;
        }

        if (temp != i) {
            swap(i, temp);
            addHelp(temp);
        }

    }

    /**
     * Removes and returns the root of the heap.
     *
     * Do not shrink the backing array.
     *
     * Replace any unused spots in the array with null.
     *
     * @return the data that was removed
     * @throws java.util.NoSuchElementException if the heap is empty
     */
    public T remove() {
        if (isEmpty()) {
            throw new NoSuchElementException("The heap is empty.");
        }
        T trash = backingArray[1];
        backingArray[1] = null;

        swap(1, size);
        size--;
        removeHelp(1);

        return trash;
    }
    /**
     * Helper method for when we are removing elements from the heap
     *
     * @param i the index of  the element
     */
    private void removeHelp(int i) {
        int left = 2 * i;
        int right = 2 * i + 1;
        int temp = i;

        if (left <= size
                && backingArray[left].compareTo(backingArray[temp]) > 0) {
            temp = left;
        }
        if (right <= size
                && backingArray[right].compareTo(backingArray[temp]) > 0) {
            temp = right;
        }
        if (temp == left) {
            swap(i, temp);
            removeHelp(i * 2);
        } else if (temp == right) {
            swap(i, temp);
            removeHelp(i * 2 + 1);
        }
    }
    /**
     * Returns the maximum element in the heap.
     *
     * @return the maximum element
     * @throws java.util.NoSuchElementException if the heap is empty
     */
    public T getMax() {
        if (size == 0) {
            throw new NoSuchElementException("The heap is empty.");
        }
        return backingArray[1];
    }

    /**
     * Returns whether or not the heap is empty.
     *
     * @return true if empty, false otherwise
     */
    public boolean isEmpty() {
        return (size == 0);
    }

    /**
     * Clears the heap.
     *
     * Resets the backing array to a new array of the initial capacity and
     * resets the size.
     */
    public void clear() {
        backingArray = (T[]) new Comparable[INITIAL_CAPACITY];
        size = 0;
    }

    /**
     * Returns the backing array of the heap.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the backing array of the list
     */
    public T[] getBackingArray() {
        // DO NOT MODIFY THIS METHOD!
        return backingArray;
    }

    /**
     * Returns the size of the heap.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the size of the list
     */
    public int size() {
        // DO NOT MODIFY THIS METHOD!
        return size;
    }
    /**
     * Helper method for swapping elements within the heap
     *
     * @param i1 index to swap with i2
     * @param i2 index to swap with i1
     */
    private void swap(int i1, int i2) {
        T temp = backingArray[i1];
        backingArray[i1] = backingArray[i2];
        backingArray[i2] = temp;
    }
    /**
     * Method that doubles the capacity of the array once the capacity is full
     */
    private void resizeArray() {
        T[] newArray = (T[]) new Comparable[backingArray.length * 2];
        for (int i = 1; i < backingArray.length; i++) {
            newArray[i] = backingArray[i];
        }
        backingArray = newArray;
    }
}
