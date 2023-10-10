const factorial = (n) => {
  let ret = 1;
  for (let i = n; i > 0; i--) ret *= i;
  return ret;
};

const permutation = (n, r) => factorial(n) / factorial(n - r);

const combination = (n, r) => permutation(n, r) / factorial(r);

const multiPermutation = (n, r) => n ** r;

const multiCombination = (n, r) => combination(n + r - 1, r);

module.exports = {
  permutation,
  combination,
  multiPermutation,
  multiCombination,
};
