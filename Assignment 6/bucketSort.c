#include <stdio.h>
#include <stdlib.h>

int NUM_OF_BUCKETS = 10;
// INSERTION SORT
void insertionSort(float arr[], int p)
{
    for (int i = 0; i < p; i++)
    {
        float val = arr[i];
        int j = i;

        while (j > 0 && arr[j - 1] > val)
        {
            arr[j] = arr[j - 1];
            j--;
        }
        arr[j] = val;
    }
}

// BUCKET SORT
void bucketSort(float arr[], int p)
{
    // Create n empty buckets
    float buckets[NUM_OF_BUCKETS][p];
    for (int i = 0; i < NUM_OF_BUCKETS; i++)
    {
        for (int j = 0; j < p; j++)
        {
            buckets[i][j] = 0.0;
        }
    }

    // Put array elements in different buckets
    for (int i = 0; i < p; i++)
    {
        int bucketIndex = NUM_OF_BUCKETS * arr[i];
        buckets[bucketIndex][i] = arr[i];
    }

    // Sort individual buckets
    for (int i = 0; i < NUM_OF_BUCKETS; i++)
    {
        insertionSort(buckets[i], p);
    }

    // Concatenate all buckets into arr[]
    int index = 0;
    for (int i = 0; i < NUM_OF_BUCKETS; i++)
    {
        for (int j = 0; j < p; j++)
        {
            if (buckets[i][j] != 0.0)
            {
                arr[index++] = buckets[i][j];
            }
        }
    }
}

// DRIVER CODE
int main()
{
    float arr[] = {0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434};
    int n = sizeof(arr) / sizeof(arr[0]);

    bucketSort(arr, n);

    printf("Sorted array is: ");
    for (int i = 0; i < n; i++)
    {
        printf("%.4f ", arr[i]);
    }
    printf("\n");
    return 0;
}