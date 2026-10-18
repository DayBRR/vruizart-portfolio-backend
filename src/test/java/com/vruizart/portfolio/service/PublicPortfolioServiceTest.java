package com.vruizart.portfolio.service;

import com.vruizart.portfolio.repository.ArtworkRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class PublicPortfolioServiceTest {
    @Mock ArtworkRepository artworks;
    @InjectMocks PublicPortfolioService service;

    @Test
    void optionalTechniqueAndCollectionUseTheExistingCatalogScope() {
        var pageable = PageRequest.of(0, 12);
        when(artworks.findVisibleIds(null, pageable)).thenReturn(Page.empty(pageable));
        for (String technique : new String[]{null, "", "  ", "\t\n"}) {
            service.getArtworks(null, technique, pageable);
            service.getArtworks("  ", technique, pageable);
        }
        verify(artworks, times(8)).findVisibleIds(null, pageable);
        verifyNoMoreInteractions(artworks);
    }

    @Test
    void combinedFilterDelegatesNameNormalizationToSqlAndPreservesCollectionSlugRules() {
        var pageable = PageRequest.of(1, 12);
        when(artworks.findVisibleIdsByCollectionSlug("retratos", "  Óleo sobre lienzo  ", pageable))
                .thenReturn(Page.empty(pageable));
        service.getArtworks("retratos", "  Óleo sobre lienzo  ", pageable);
        verify(artworks).findVisibleIdsByCollectionSlug("retratos", "  Óleo sobre lienzo  ", pageable);
        verifyNoMoreInteractions(artworks);
    }

    @Test
    void optionsNormalizeOnlyAbsentCollections() {
        service.getArtworkTechniques(null);
        service.getArtworkTechniques("\t ");
        service.getArtworkTechniques(" retratos ");
        verify(artworks, times(2)).findVisibleTechniqueNames(null);
        verify(artworks).findVisibleTechniqueNames(" retratos ");
    }
}
