# Demo2

### Navodila za buildanje aplikacije z več frameworki

1. MainApp
   Project, je glavni del aplikacije

2. Business
   Framework, ki je edini povezan z MainApp
   Vsebuje logiko aplikacije in povezuje ostale frameworke.
   Primer: fetchUser() -> prvo gre v FirestoreFramework in dobi user info iz baze, nato gre v StorageFramework in userju doda profilno sliko

4. Frameworks
  So ločene enote v aplikaciji, ki jih povezemo v Business

5. Package Dependencies
   MainApp -> Vse loibrarije iz firebase (npr. firestore, auth, storage) in povezava na business
   Business -> Povezava na vse locene frameworke
   Ostali Frameworki -> Povezava na firebase libraries, ki jih uporabljajo
