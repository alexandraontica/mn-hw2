function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).
  # read the .csv file, remove the commas and create the matrix with the data from the file:
  mat = csvread(path);

  # delete the first row and the first column:
  mat = mat(2 : end, 2 : end);
end
