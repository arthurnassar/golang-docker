FROM golang AS build

WORKDIR /go/src

COPY . .

RUN go build -o .

FROM scratch

WORKDIR /go/src

COPY --from=build /go/src/hello .

ENTRYPOINT ["./hello"]  