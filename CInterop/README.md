# C Interop in Beef
Nothing much to talking here. C Interop in Beef is well-designed based on C#, which is familiar and easy to use. Two key points here are: 
- Beef struct layout are different from C struct layout, need to add attribute [CRepr] to make use C struct layout.
- [Import] will import functions from DLL dynamically, use with care. Use library linking in BeefProject.toml instead.

## Further readings
https://www.beeflang.org/docs/language-guide/interop/