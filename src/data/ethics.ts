export interface EthicValue {
  id: string;
  title: string;
  type: 'Concept' | 'Value';
}

export const ethics: { principles: EthicValue[], letter: string } = {
  principles: [
    { id: 'apps_concept', title: 'Apps', type: 'Concept' },
    { id: 'ethics_values_concept', title: 'Ethics & Values', type: 'Concept' },
    { id: 'games_concept', title: 'Games', type: 'Concept' },
    { id: 'convenience', title: 'Convenience', type: 'Value' },
    { id: 'simplicity', title: 'Simplicity', type: 'Value' },
    { id: 'usefulness', title: 'Usefulness', type: 'Value' },
    { id: 'safety', title: 'Safety', type: 'Value' },
    { id: 'longevity', title: 'Longevity (Durability)', type: 'Value' },
    { id: 'creativity', title: 'Creativity', type: 'Value' },
    { id: 'fun', title: 'Fun', type: 'Value' },
    { id: 'challenge', title: 'Challenge', type: 'Value' },
    { id: 'style', title: 'Style', type: 'Value' },
  ],
  letter: `Personal Thoughts of why to care:

I love to use Excel.
For me the most important thing in it is its durability:
even if a file created 10 years ago it will still work like or almost like intended..

The same thing with macOS - it just works, even you spilled at it the whole cup of lemon water and it was half of year in repair. When you open it again, it still has everything untouched like you just worked.

Playing games, drawing, studying and reading books is fun. And I think the art should be a part of the everything - game, education and science can coexist together and the best way to learn something - by doing..

Anton Malofeev (Arenukvern)`
};
