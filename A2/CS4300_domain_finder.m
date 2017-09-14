function arc_queue = CS4300_domain_finder( queue, G, d_index )
% Helper function for discovering the domain neighbors
arc_queue = queue;
for g_index=1:size(G,1)
    if G(d_index, g_index) == 1
        arc_queue = [arc_queue; d_index, g_index];
    end
end

end

