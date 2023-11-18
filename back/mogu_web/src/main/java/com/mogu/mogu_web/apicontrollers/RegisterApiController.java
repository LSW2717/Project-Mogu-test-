package com.mogu.mogu_web.apicontrollers;

import com.mogu.mogu_web.dto.requestDto.UserRequestDto;
import com.mogu.mogu_web.dto.responseDto.MessageResponse;
import com.mogu.mogu_web.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
public class RegisterApiController {
    private final UserService userService;

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody UserRequestDto userRequestDto) {
        try {
            userService.registerNewUser(userRequestDto);
            return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
        } catch (RuntimeException ex) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse(ex.getMessage()));
        }
    }


}
