function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  [m n] = size(mat);

  remove_clients = zeros(m, 1);

  for i = 1 : m
    # count the reviews of the current client:
    cnt = 0;
    for j = 1 : n
      if (mat(i, j) != 0)
        cnt++;
      endif
    endfor

    if (cnt < min_reviews)
      # mark the client as ready to be removed:
      remove_clients(i) = 1;
    endif
  endfor

  # keep only the rows with clients with the minimum reviews required:
  reduced_mat = mat(~remove_clients, :);
end
