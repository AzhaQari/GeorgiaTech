import java.util.*;

/**
 * Your implementation of various sorting algorithms.
 *
 * @author Azha Qari
 * @version 1.0
 * @userid aqari3 (i.e. gburdell3)
 * @GTID 903481053
 *
 * Collaborators: None
 *
 * Resources: stackoverflow
 */
public class Sorting {

    /**
     * Implement selection sort.
     *
     * It should be:
     * in-place
     * unstable
     * not adaptive
     *
     * Have a worst case running time of:
     * O(n^2)
     *
     * And a best case running time of:
     * O(n^2)
     *
     * @param <T>        data type to sort
     * @param arr        the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     * @throws java.lang.IllegalArgumentException if the array or comparator is
     *                                            null
     */
    public static <T> void selectionSort(T[] arr, Comparator<T> comparator) {
        if (comparator == null) {
            throw new IllegalArgumentException("The comparator cannot be null.");
        }

        if (arr == null) {
            throw new IllegalArgumentException("The array cannot be null.");
        }

        for (int i = arr.length - 1; i > 0; i--) {
            int last = i;
            int prev = i - 1;

            while (prev >= 0) {
                if (0 < comparator.compare(arr[prev], arr[last])) {
                    last = prev;
                }
                prev--;
            }

            if (last != i) {
                T temp = arr[last];
                arr[last] = arr[i];
                arr[i] = temp;
            }
        }
    }

    /**
     * Implement cocktail sort.
     *
     * It should be:
     * in-place
     * stable
     * adaptive
     *
     * Have a worst case running time of:
     * O(n^2)
     *
     * And a best case running time of:
     * O(n)
     *
     * NOTE: See pdf for last swapped optimization for cocktail sort. You
     * MUST implement cocktail sort with this optimization
     *
     * @param <T>        data type to sort
     * @param arr        the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     * @throws java.lang.IllegalArgumentException if the array or comparator is
     *                                            null
     */
    public static <T> void cocktailSort(T[] arr, Comparator<T> comparator) {
        if (comparator == null) {
            throw new IllegalArgumentException("The comparator cannot be null.");
        }

        if (arr == null) {
            throw new IllegalArgumentException("The array cannot be null.");
        }

        int first = 0;
        int last = arr.length - 1;
        boolean swapped = true;

        while (swapped) {
            swapped = false;
            for (int i = first; i < last; i++) {
                if (comparator.compare(arr[i], arr[i + 1]) > 0) {
                    T store = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = store;
                    swapped = true;
                }
            }
            last--;

            if (swapped) {
                swapped = false;
            } else {
                break;
            }

            for (int i = last; i > first; i--) {
                if (comparator.compare(arr[i], arr[i + 1]) > 0) {
                    T store = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = store;
                    swapped = true;
                }
            }

            first++;
        }
    }

    /**
     * Implement merge sort.
     *
     * It should be:
     * out-of-place
     * stable
     * not adaptive
     *
     * Have a worst case running time of:
     * O(n log n)
     *
     * And a best case running time of:
     * O(n log n)
     *
     * You can create more arrays to run merge sort, but at the end, everything
     * should be merged back into the original T[] which was passed in.
     *
     * When splitting the array, if there is an odd number of elements, put the
     * extra data on the right side.
     *
     * Hint: If two data are equal when merging, think about which subarray
     * you should pull from first
     *
     * @param <T>        data type to sort
     * @param arr        the array to be sorted
     * @param comparator the Comparator used to compare the data in arr
     * @throws java.lang.IllegalArgumentException if the array or comparator is
     *                                            null
     */
    public static <T> void mergeSort(T[] arr, Comparator<T> comparator) {
        if (comparator == null) {
            throw new IllegalArgumentException("The comparator cannot be null.");
        }
        if (arr == null) {
            throw new IllegalArgumentException("The array cannot be null.");
        }

        if (arr.length <= 1) {
            return;
        }
        int mid = arr.length / 2;

        T[] l = (T[]) new Object[mid];
        T[] r = (T[]) new Object[arr.length - mid];

        for (int i = 0; i < l.length; i++) {
            l[i] = arr[i];
        }
        for (int i = 0; i < r.length; i++) {
            r[i] = arr[i + mid];
        }

        mergeSort(l, comparator);
        mergeSort(r, comparator);

        int i = 0;
        int k = 0;
        int curr = 0;

        while (k < r.length && i < l.length) {
            if (comparator.compare(l[i], r[k]) <= 0) {
                arr[curr] = l[i];
                i++;
            } else {
                arr[curr] = r[k];
                k++;
            }
            curr++;
        }

        while (i < l.length) {
            arr[curr] = l[i];
            i++;
            curr++;
        }

        while (k < r.length) {
            arr[curr] = r[k];
            k++;
            curr++;
        }
    }

    /**
     * Implement quick sort.
     *
     * Use the provided random object to select your pivots. For example if you
     * need a pivot between a (inclusive) and b (exclusive) where b > a, use
     * the following code:
     *
     * int pivotIndex = rand.nextInt(b - a) + a;
     *
     * If your recursion uses an inclusive b instead of an exclusive one,
     * the formula changes by adding 1 to the nextInt() call:
     *
     * int pivotIndex = rand.nextInt(b - a + 1) + a;
     *
     * It should be:
     * in-place
     * unstable
     * not adaptive
     *
     * Have a worst case running time of:
     * O(n^2)
     *
     * And a best case running time of:
     * O(n log n)
     *
     * Make sure you code the algorithm as you have been taught it in class.
     * There are several versions of this algorithm and you may not receive
     * credit if you do not use the one we have taught you!
     *
     * @param <T>        data type to sort
     * @param arr        the array that must be sorted after the method runs
     * @param comparator the Comparator used to compare the data in arr
     * @param rand       the Random object used to select pivots
     * @throws java.lang.IllegalArgumentException if the array or comparator or
     *                                            rand is null
     */
    public static <T> void quickSort(T[] arr, Comparator<T> comparator,
                                     Random rand) {
        if (comparator == null) {
            throw new IllegalArgumentException("The comparator cannot be null.");
        }
        if (rand == null) {
            throw new IllegalArgumentException("Random cannot be null.");
        }
        if (arr == null) {
            throw new IllegalArgumentException("The array cannot be null.");
        }
        quickSortHelper(arr, 0, arr.length - 1, comparator, rand);

    }
    /**
     * Quick sort helper
     * @param <T> data type to sort
     * @param arr array to be sorted
     * @param first index
     * @param last index
     * @param comparator tool for comparison
     * @param rand pivot point
     */
    private static <T> void quickSortHelper(T[] arr, int first, int last,
                                      Comparator<T> comparator, Random rand) {
        if (last < first) {
            return;
        }
        int a = first + 1;
        int b = last;
        int pivot = rand.nextInt(last - first + 1) + first;

        T temp = arr[pivot];
        arr[pivot] = arr[first];
        arr[first] = temp;

        while (a <= b) {
            while (a <= b && comparator.compare(arr[a], arr[first]) <= 0) {
                a++;
            }
            while (a <= b && comparator.compare(arr[b], arr[first]) >= 0) {
                b--;
            }
            if (a <= b) {
                T sto2 = arr[a];
                arr[a] = arr[b];
                arr[b] = sto2;
                a++;
                b--;
            }
        }

        arr[first] = arr[b];
        arr[b] = temp;

        quickSortHelper(arr, first, b - 1, comparator, rand);
        quickSortHelper(arr, b + 1, last, comparator, rand);
    }
    /**
     * Implement LSD (least significant digit) radix sort.
     *
     * Make sure you code the algorithm as you have been taught it in class.
     * There are several versions of this algorithm and you may not get full
     * credit if you do not implement the one we have taught you!
     *
     * Remember you CANNOT convert the ints to strings at any point in your
     * code! Doing so may result in a 0 for the implementation.
     *
     * It should be:
     * out-of-place
     * stable
     * not adaptive
     *
     * Have a worst case running time of:
     * O(kn)
     *
     * And a best case running time of:
     * O(kn)
     *
     * You are allowed to make an initial O(n) passthrough of the array to
     * determine the number of iterations you need. The number of iterations
     * can be determined using the number with the largest magnitude.
     *
     * At no point should you find yourself needing a way to exponentiate a
     * number; any such method would be non-O(1). Think about how how you can
     * get each power of BASE naturally and efficiently as the algorithm
     * progresses through each digit.
     *
     * Refer to the PDF for more information on LSD Radix Sort.
     *
     * You may use ArrayList or LinkedList if you wish, but it may only be
     * used inside radix sort and any radix sort helpers. Do NOT use these
     * classes with other sorts. However, be sure the List implementation you
     * choose allows for stability while being as efficient as possible.
     *
     * Do NOT use anything from the Math class except Math.abs().
     *
     * @param arr the array to be sorted
     * @throws java.lang.IllegalArgumentException if the array is null
     */
    public static void lsdRadixSort(int[] arr) {
        if (arr == null) {
            throw new IllegalArgumentException("Error, array is null!");
        }

        if (arr.length <= 1) {
            return;
        }

        int max = arr[0];
        int iter = 1;
        for (int i = 0; i < arr.length; i++) {
            if (Math.abs(arr[i]) > max) {
                max = Math.abs(arr[i]);
            }
        }
        while (max >= 10) {
            iter++;
            max = max / 10;
        }

        List<Integer>[] buckets = new LinkedList[19];

        for (int i = 0; i < buckets.length; i++) {
            buckets[i] = new LinkedList<Integer>();
        }

        int div = 1;

        for (int i = 0; i < iter; i++) {
            for (Integer entry: arr) {
                buckets[((entry / div) % 10) + 9].add(entry);
            }

            int curr = 0;
            for (int j = 0; j < buckets.length; j++) {
                while (!buckets[j].isEmpty()) {
                    arr[curr] = buckets[j].remove(0);
                    curr++;
                }

            }
            div = div * 10;
        }
    }

    /**
     * Implement heap sort.
     *
     * It should be:
     * out-of-place
     * unstable
     * not adaptive
     *
     * Have a worst case running time of:
     * O(n log n)
     *
     * And a best case running time of:
     * O(n log n)
     *
     * Use java.util.PriorityQueue as the heap. Note that in this
     * PriorityQueue implementation, elements are removed from smallest
     * element to largest element.
     *
     * Initialize the PriorityQueue using its build heap constructor (look at
     * the different constructors of java.util.PriorityQueue).
     *
     * Return an int array with a capacity equal to the size of the list. The
     * returned array should have the elements in the list in sorted order.
     *
     * @param data the data to sort
     * @return the array with length equal to the size of the input list that
     * holds the elements from the list is sorted order
     * @throws java.lang.IllegalArgumentException if the data is null
     */
    public static int[] heapSort(List<Integer> data) {
        if (data == null) {
            throw new IllegalArgumentException("Data cannot be null!");
        }
        PriorityQueue<Integer> pq = new PriorityQueue<>(data);
        int x = data.size();
        int[] output = new int[x];
        int length = output.length;

        for (int i = 0; i < length; i++) {
            output[i] = pq.remove();
        }
        return output;
    }
}
