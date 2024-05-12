function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  mat = read_mat(path);
  mat = preprocess(mat, min_reviews);

  # reduced SVD:
  [~, ~, V] = svds(mat, num_features);
  
  n = size(V, 1);
  similarities = zeros(n, 1);

  # compare each row in V with the one corresponding to the liked theme:
  for i = 1 : n
    similarities(i) = cosine_similarity(V(liked_theme, :)', V(i, :)');
  endfor
  
  [sorted_sim, indices] = sort(similarities, 'descend');
  
  # the first element corresponds to the liked_theme, so I skip it;
  # return the next num_recoms indices:
  recoms = indices(2 : num_recoms + 1);
  recoms = recoms';
end
