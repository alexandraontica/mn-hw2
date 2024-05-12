function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  mat = read_mat(path);
  mat = preprocess(mat, min_reviews);

  [~, ~, V] = svds(mat, num_features);
  
  similarities = zeros(size(V, 1), 1);
  for i = 1 : size(V, 1)
    similarities(i) = cosine_similarity(V(liked_theme, :)', V(i, :)');
  endfor
  
  [~, sorted_indices] = sort(similarities, 'descend');
  
  recoms = sorted_indices(2 : num_recoms + 1);
  recoms = recoms';
end
