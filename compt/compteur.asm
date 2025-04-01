BITS 64

global _start

section .text

_start:
    xor     r12, r12        ; init a 0
    
boucle:
    mov     rax, r12        ; Valeur à convertir
    sub     rsp, 16         ; Réserver de l'espace sur la pile
    mov     rdi, rsp        ; rdi pointe vers la pile
    mov     byte [rdi+15], 10 ; Ajouter saut de ligne à la fin
    mov     rcx, 14         ; Position de départ (de droite à gauche)
    
    ; Si le nombre est 0, traitement spécial
    test    rax, rax
    jnz     conversion
    mov     byte [rdi+rcx], '0'
    dec     rcx
    jmp     affichage
    
conversion:
    ; Convertir chaque chiffre
    mov     rbx, 10
    xor     rdx, rdx
    div     rbx             ; rax / 10, quotient dans rax, reste dans rdx
    add     dl, '0'         ; Convertir en ASCII
    mov     [rdi+rcx], dl   ; Stocker dans la pile
    dec     rcx             ; Position suivante
    test    rax, rax        ; Vérifier si on a fini
    jnz     conversion      ; Continuer si non
    
affichage:
    ; Calculer longueur à afficher
    inc     rcx             ; Ajuster pour obtenir l'offset
    lea     rsi, [rdi+rcx]  ; rsi pointe vers le premier chiffre
    mov     rdx, 16         ; Longueur max
    sub     rdx, rcx        ; Calculer longueur exacte
    
    ; Appel système write
    mov     rax, 1          ; sys_write
    mov     rdi, 1          ; stdout
    syscall
    
    ; Nettoyer la pile
    add     rsp, 16
    
    ; Incrémenter et boucler
    inc     r12
    cmp     r12, 10001
    jne     boucle
    
    ; Terminer
    mov     rax, 60         ; sys_exit
    xor     rdi, rdi        ; code 0
    syscall
