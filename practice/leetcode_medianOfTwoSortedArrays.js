// median of two sorted arrays without merging them : O(n + m)
// find the solution doing a binary search like operation: O(logn+ logm)

// nums1 = [1, 2, 6, 10]
// nums2 = [3, 4, 5, 8]
// The median is (4+5) / 2 = 4.5

// 6 > 5 so take off 10 and 3
// [1,2,6], [4,5,8]
// 2<5 so take off 1 and 8 
// [2,6], [4,5]
// 6 > 5 so take off 6 and 4 
// [2], [5] WRONG

// Just merge the remaining two at the end instead

// [1, 2, 5, 10]
// [2, 4, 8, 9]  
// 1, 2, 2, 4, 5, 8, 9, 10 > 4.5

// nums1 = [2,3,4,5,6,7,10,15,22,100];
// nums2 = [14,200, 201, 202, 205, 210, 3000];

// median(nums1, nums2);
function findMedianSortedArrays(sorted1, sorted2) {
  let even = ((sorted1.length + sorted2.length) % 2 === 1) ? false : true;
  while (sorted1.length > 2 && sorted2.length > 2) {
    if (sorted1[Math.floor(sorted1.length / 2)] > sorted2[Math.floor(sorted2.length / 2)]) {
      sorted1.pop();
      sorted2.shift();
    } else {
      sorted1.shift();
      sorted2.pop();
    }
  }

  let merged = [];
  while (sorted1.length && sorted2.length) {
    let first = sorted1[0];
    let second = sorted2[0];
    if (first > second) {
      merged.push(second);
      sorted2.shift();
    } else {
      merged.push(first);
      sorted1.shift();
    }
  }
  merged = merged.concat(sorted1).concat(sorted2);
  if (even) {
    return (merged[(merged.length / 2)] + merged[(merged.length / 2) - 1]) / 2;
  } else {
    return merged[Math.floor(merged.length / 2)];
  }
}
